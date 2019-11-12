using System;
using System.Collections;
using System.Collections.Generic;
using KinematicCharacterController;
using KinematicTest.controller;
using UnityEngine;

public class KinematicTrajectoryPredictor : MotionMatchable
{
    private Collider[] _probedColliders = new Collider[8];
    
    public KinematicCharacterMotor motor;
    public KinematicTestController controller;
    public Animator animator;
    public MMConfig config;
    public bool showGizmos;

    public override TrajectoryInfo PredictTrajectory()
    {
        return new TrajectoryInfo(new Vector3[0], new Vector3[0]);
    }

    private Vector3 ExplicitEuler(float deltaTime)
    {
        Vector3 grav = controller.Gravity;
        Vector3 velocity = motor.Velocity;
        if(!motor.GroundingStatus.IsStableOnGround && !motor.GroundingStatus.FoundAnyGround || controller.JumpingThisFrame())
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
        if (showGizmos)
        {
            //jank shit
            var v = ExplicitEuler(0.2f);
            Gizmos.DrawWireSphere(v, 0.2f);
            var va = ExplicitEuler(0.4f);
            Gizmos.DrawWireSphere(va, 0.2f);
            var vb = ExplicitEuler(0.6f);
            Gizmos.DrawWireSphere(vb, 0.2f);
            var vc = ExplicitEuler(0.8f);
            Gizmos.DrawWireSphere(vc, 0.2f);
        }
    }
}