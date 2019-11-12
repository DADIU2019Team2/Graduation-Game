using System;
using System.Collections;
using System.Collections.Generic;
using KinematicCharacterController;
using KinematicTest.controller;
using UnityEngine;

public class KinematicTrajectoryPredictor : MotionMatchable
{
    private int MaxDiscreteCollisionIterations = 3;
    private Collider[] _probedColliders = new Collider[8];
    public KinematicCharacterMotor motor;
    public KinematicTestController controller;
    public Animator animator;
    public MMConfig config;
    public bool showGizmos;
    public Vector3[] trajectoryPoints;

    private void Awake()
    {
        trajectoryPoints = new Vector3[config.trajectoryTimePoints.Count];
    }

    private void FixedUpdate()
    {
        PredictTrajectory();
    }

    public override TrajectoryInfo PredictTrajectory()
    {
        for (int i = 0; i < config.trajectoryTimePoints.Count; i++)
        {
            trajectoryPoints[i] = ExplicitEuler(config.trajectoryTimePoints[i]);
        }
        return new TrajectoryInfo(new Vector3[0], new Vector3[0]);
    }

    private Vector3 ExplicitEuler(float deltaTime)
    {
        Vector3 grav = controller.Gravity;
        Vector3 velocity = motor.BaseVelocity;
        if (!motor.GroundingStatus.IsStableOnGround && !motor.GroundingStatus.FoundAnyGround ||
            controller.JumpingThisFrame())
            velocity = velocity + grav * deltaTime;


        Vector3 position = transform.position;
        Vector3 predictedPosition = position + velocity * deltaTime;
        ProjectPredictedPosition(predictedPosition);
        return predictedPosition;
    }

    private Vector3 ProjectPredictedPosition(Vector3 predictedPosition)
    {
        var alma = motor.CharacterOverlap(predictedPosition, Quaternion.identity, _probedColliders,
            motor.CollidableLayers,
            QueryTriggerInteraction.Ignore);
        if (alma > 0)
        {
            Gizmos.color = Color.red;
        }
        else
        {
            Gizmos.color = Color.white;
        }

        return Vector3.zero;
    }

    private void OnDrawGizmos()
    {
        if (showGizmos && trajectoryPoints != null)
        {
            foreach (var v in trajectoryPoints)
            {
                Gizmos.DrawWireSphere(v, 0.2f);
            }
        }
    }
}