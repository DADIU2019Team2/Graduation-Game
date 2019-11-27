using System.Collections;
using System.Collections.Generic;
using Unity.Burst;
using Unity.Collections;
using Unity.Jobs;
using Unity.Mathematics;
using UnityEngine;

public class MMSeparatedController : MonoBehaviour
{
    public MMMotionData poseData;
    public MotionMatchable predictor;
    public Animator animator;
    [Range(1, 60)] public int poseRefreshRate;
    [Range(0f, 1f)] public float crossFadeTime;
    public bool isMotionMatchingRunning;
    private NativeArray<float3> trajectoryNativeArray;
    private NativeArray<float> trajWeightNativeArray;
    private NativeArray<float3> trajCostCompareNativeArray;
    public int bestIndex;
    public float trajectoryToPoseRatio;
    public float[] trajWeights;
    public float[] poseWeights;
    private int trajPoints;
    private int boneCount;
    private int chunkLength;
    private string current;

    private void PlayAtUniqueFrame(int frame)
    {
        AnimLookup toPlay = poseData.GetAnimationAtFrame(frame);
        animator.CrossFadeInFixedTime(toPlay.Value, crossFadeTime, 0, toPlay.Key / 30f);
        current = toPlay.Value;
    }

    private bool IsFrameTooClose(int frame, float threshold)
    {
        float currentAnimTime = animator.GetCurrentAnimatorStateInfo(0).normalizedTime;
        AnimLookup aLookup = poseData.GetAnimationAtFrame(frame);
        return (aLookup.Value == current && Mathf.Abs((aLookup.Key / 30f) - currentAnimTime) < threshold);
    }

    public void StartMotionMatching()
    {
        if (isMotionMatchingRunning) return;
        StartCoroutine(nameof(QueryForPose));
        isMotionMatchingRunning = true;
    }

    private IEnumerator QueryForPose()
    {
        while (true)
        {
            yield return new WaitForSeconds(1f / poseRefreshRate);
        }
    }

    [BurstCompile]
    public struct TrajectoryCostJob : IJobParallelFor
    {
        [ReadOnly] public NativeArray<float3> trajectoryFlatArray;
        [ReadOnly] public NativeArray<float3> predictedTrajectory;
        [ReadOnly] public NativeArray<float> trajectoryWeights;
        public NativeArray<float> result;

        public void Execute(int index)
        {
            int chunkLength = predictedTrajectory.Length;
            for (int j = 0; j < chunkLength; j++)
            {
                result[index] += math.distancesq(predictedTrajectory[j], trajectoryFlatArray[index * chunkLength + j]) *
                                 trajectoryWeights[j];
            }
        }
    }

    [BurstCompile]
    public struct SortTrajectoryJob : IJob
    {
        [ReadOnly] public NativeArray<float> results;
        public NativeArray<int> indices;

        public void Execute()
        {
            int k = 0;
            for (int i = 0; i < results.Length; i++)
            {
                if (k < indices.Length - 1) //indices not full
                {
                    if (results[i] > results[indices[k]])
                    {
                        //current is higher than highest in sorted array
                        //fill up array by concatenating index at end
                        k++;
                        indices[k] = i;
                    }
                    else
                    {
                        //fill up array by sorting stuff
                        for (int j = k; j >= 0; j--)
                        {
                            if (results[i] < results[indices[j]])
                            {
                                indices[j + 1] = indices[j];
                            }
                            else
                            {
                                indices[j + 1] = i;
                                break;
                            }
                        }

                        k++;
                    }
                }
                else
                {
                    if (results[i] <= results[indices[k]])
                    {
                        //sort stuff
                        for (int j = k - 1; j >= 0; j--)
                        {
                            if (results[i] < results[indices[j]])
                            {
                                indices[j + 1] = indices[j];
                            }
                            else
                            {
                                indices[j + 1] = i;
                                break;
                            }
                        }
                    }
                }
            }
        }
    }

    [BurstCompile]
    public struct PoseCostJob : IJobParallelFor
    {
        [ReadOnly] public NativeArray<float3> bestPoseArray;
        [ReadOnly] public NativeArray<float3> currentPose;
        [ReadOnly] public NativeArray<float> poseWeights;
        public NativeArray<float> result;

        public void Execute(int index)
        {
            int chunkLength = currentPose.Length;
            for (int j = 0; j < chunkLength; j++)
            {
                result[index] += math.distancesq(currentPose[j], bestPoseArray[index * chunkLength + j]) *
                                 poseWeights[j];
            }
        }
    }

    [BurstCompile]
    public struct AnimationSelectionJob : IJob
    {
        [ReadOnly] public NativeArray<float> results;
        [ReadOnly] public NativeArray<int> indices;
        public NativeArray<int> selectedIndex;
        public void Execute()
        {
            float best = float.MaxValue;
            for (int i = 0; i < results.Length; i++)
            {
                if (results[i] < best)
                    selectedIndex[0] = indices[i];
            }
        }
    }

    private float3[] BuildTrajectoryArray()
    {
        int cL = trajPoints * 2; //8
        float3[] trajArr = new float3[poseData.Length * cL];

        for (int i = 0; i < poseData.Length; i++)
        {
            for (int j = 0; j < trajPoints; j++)
            {
                trajArr[(i * cL) + j] = poseData.frameInfo[i].trajectoryInfo.trajectoryPoints[j];
                trajArr[(i * cL) + trajPoints + j] = poseData.frameInfo[i].trajectoryInfo.trajectoryForwards[j];
            }
        }

        return trajArr;
    }

    private float3[] BuildBestPoseArray(NativeArray<int> indices)
    {
        int cL = 2 * boneCount;
        float3[] poseArr = new float3[cL * indices.Length];
        for (int i = 0; i < indices.Length; i++)
        {
            for (int j = 0; j < boneCount; j++)
            {
                poseArr[(i * cL) + j] = poseData.frameInfo[indices[i]].pose.jointPositions[j];
                poseArr[(i * cL) + boneCount + j] = poseData.frameInfo[indices[i]].pose.jointPositions[j];
            }
        }

        return poseArr;
    }


    private float3[] CreateDesiredChunk(int size) // not dynamic
    {
        float3[] chunkArr = new float3[size];
        var desiredTraj = predictor.PredictTrajectory();
        var currentPose = predictor.GetPose();
        for (int j = 0; j < desiredTraj.trajectoryPoints.Length; j++)
        {
            chunkArr[j] = desiredTraj.trajectoryPoints[j];
            chunkArr[j + 4] = desiredTraj.trajectoryForwards[j];
        }

        for (int j = 0; j < currentPose.jointPositions.Count; j++)
        {
            chunkArr[j + 7] = currentPose.jointPositions[j];
            chunkArr[j + 11] = currentPose.jointVelocities[j];
        }

        return chunkArr;
    }
}