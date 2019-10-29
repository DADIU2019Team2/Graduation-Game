using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LiveDebugger : MonoBehaviour
{
    private Animator a;
    public MMConfig config;
    public MMAnimationClip mmAnimClip;
    public Vector3[] tempPositions;
    public Vector3[] velocities;
    public Transform rootJoint;

    private void Awake()
    {
        a = GetComponent<Animator>();
        tempPositions = new Vector3[config.trackedBones.Count];
        velocities = new Vector3[config.trackedBones.Count];
    }

    private void FixedUpdate()
    {
        for (int i = 0; i < config.trackedBones.Count; i++)
        {
            var bone = config.trackedBones[i];
            velocities[i] = rootJoint.worldToLocalMatrix.inverse.MultiplyVector(
                (rootJoint.worldToLocalMatrix.MultiplyPoint3x4(a.GetBoneTransform(bone).position) - tempPositions[i])) /
                Time.deltaTime;

            tempPositions[i] = rootJoint.worldToLocalMatrix.MultiplyPoint3x4(a.GetBoneTransform(bone).position);
        }
    }

    public Pose GetPose()
    {
        List<Vector3> posList = new List<Vector3>();
        List<Vector3> velList = new List<Vector3>();
        for (int i = 0; i < velocities.Length; i++)
        {
            var bone = config.trackedBones[i];
            posList.Add(rootJoint.worldToLocalMatrix.MultiplyPoint3x4(a.GetBoneTransform(bone).position));
            velList.Add(velocities[i]);
        }
        return new Pose(posList,velList);
    }
    
    private void OnDrawGizmos()
    {
        if (a == null)
            return;
        
        for (int i = 0; i < config.trackedBones.Count; i++)
        {
            var bone = config.trackedBones[i];
            Gizmos.color = Color.magenta;
            Gizmos.DrawRay(a.GetBoneTransform(bone).position, velocities[i]);
            Gizmos.color = Color.white;
            Gizmos.DrawLine(Vector3.zero,rootJoint.worldToLocalMatrix.MultiplyPoint3x4(a.GetBoneTransform(bone).position));
        }
    }
}