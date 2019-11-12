using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CurvePreditctorFromKeyboard : MotionMatchable
{
    public float trajectoryRadius;
    public float turnAngle;
    public Vector3[] trajectoryPoints;
    public Vector3[] trajectoryForwards;
    public List<Vector3> jointPositions;
    public List<Vector3> jointVelocities;
    public float fwdHeld;
    public float rightHeld;
    public float leftHeld;
    private Vector3 prevLF = Vector3.zero;
    private Vector3 prevRF = Vector3.zero;
    private Vector3 prevN = Vector3.zero;
    private Animator a;

    
    public override TrajectoryInfo PredictTrajectory()
    {
        return new TrajectoryInfo(trajectoryPoints, trajectoryForwards);
    }

    public override Pose GetPose()
    {
        return new Pose(jointPositions,jointVelocities);
    }

    private void Awake()
    {
        a = GetComponent<Animator>();
        trajectoryPoints = new Vector3[4];
        trajectoryForwards = new Vector3[4];
        jointPositions = new List<Vector3>();
        jointVelocities = new List<Vector3>();
        for (var i = 0; i < trajectoryPoints.Length; i++)
        {
            trajectoryPoints[i] = transform.forward;
        }
    }

    private void Update()
    {
        if (Input.GetKey("w"))
        {
            fwdHeld = Mathf.Clamp(fwdHeld += Time.deltaTime, 0, 1);
        }
        else
        {
            fwdHeld = Mathf.Clamp(fwdHeld -= Time.deltaTime, 0, 1);
        }

        if (Input.GetKey("d"))
        {
            rightHeld = Mathf.Clamp(rightHeld += Time.deltaTime, 0, 1);
        }
        else
        {
            rightHeld = Mathf.Clamp(rightHeld -= Time.deltaTime, 0, 1);
        }

        if (Input.GetKey("a"))
        {
            leftHeld = Mathf.Clamp(leftHeld += Time.deltaTime, 0, 1);
        }
        else
        {
            leftHeld = Mathf.Clamp(leftHeld -= Time.deltaTime, 0, 1);
        }


        for (int i = 0; i < trajectoryPoints.Length; i++)
        {
            trajectoryPoints[i] = ((i + 1) / 4f) * trajectoryRadius * fwdHeld * transform.forward;
            Quaternion rot = Quaternion.AngleAxis(((i + 1) / 4f) * turnAngle * (rightHeld - leftHeld), transform.up);
            trajectoryPoints[i] = rot * trajectoryPoints[i];
        }

        trajectoryForwards[0] = transform.forward;
        for (int i = 1; i < trajectoryForwards.Length; i++)
        {
            trajectoryForwards[i] = (trajectoryPoints[i] - trajectoryPoints[i - 1]).normalized;
        }
    }

    private void OnDrawGizmos()
    {
        foreach (var vect in trajectoryPoints)
        {
            Gizmos.color = Color.white;
            Debug.DrawRay(transform.position, vect);
        }
    }
}