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
            yield return new WaitForSeconds(1f/poseRefreshRate);
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
            for (int j = 0; j < predictedTrajectory.Length; j++)
            {
                result[index] += math.distancesq(predictedTrajectory[j], trajectoryFlatArray[index * chunkLength + j]) * trajectoryWeights[j];
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
                if(k < indices.Length-1) //indices not full
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
                    if (results[i] > results[indices[k]])
                    {
                        //result higher than last element in sorted array
                        continue;
                    }
                    else
                    {
                        //sort stuff
                        for (int j = k-1; j >= 0; j--)
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

        public NativeArray<float> result;
        public void Execute(int index)
        {
            
        }
    }
    
    [BurstCompile]
    public struct AnimationSelectionJob : IJob
    {
        public void Execute()
        {
            
        }
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
