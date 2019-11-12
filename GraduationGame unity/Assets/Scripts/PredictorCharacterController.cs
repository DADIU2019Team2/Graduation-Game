using System.Collections;
using System.Collections.Generic;
using KinematicCharacterController;
using UnityEngine;

public class PredictorCharacterController : MonoBehaviour, ICharacterController
{
    [Space(10)] public KinematicCharacterMotor Motor;
    
    private void Start()
    {
        // Assign to motor
        Motor.CharacterController = this;
    }
    
    public void UpdateRotation(ref Quaternion currentRotation, float deltaTime)
    {
        currentRotation = Quaternion.identity;
    }

    public void UpdateVelocity(ref Vector3 currentVelocity, float deltaTime)
    {
        currentVelocity = new Vector3(0,0,0);
    }

    public void BeforeCharacterUpdate(float deltaTime)
    {
    }

    public void PostGroundingUpdate(float deltaTime)
    {
    }

    public void AfterCharacterUpdate(float deltaTime)
    {
    }

    public bool IsColliderValidForCollisions(Collider coll)
    {
        return true;
    }

    public void OnGroundHit(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint, ref HitStabilityReport hitStabilityReport)
    {
    }

    public void OnMovementHit(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint,
        ref HitStabilityReport hitStabilityReport)
    {
    }

    public void ProcessHitStabilityReport(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint, Vector3 atCharacterPosition,
        Quaternion atCharacterRotation, ref HitStabilityReport hitStabilityReport)
    {
    }

    public void OnDiscreteCollisionDetected(Collider hitCollider)
    {
    }
}
