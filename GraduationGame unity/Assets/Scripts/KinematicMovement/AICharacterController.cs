using System.Collections;
using System.Collections.Generic;
using KinematicCharacterController;
using UnityEngine;

public struct AICharacterInputs
{
    public Vector3 MoveVector;
    public float lookAheadDistance;
}

public class AICharacterController : MonoBehaviour, ICharacterController
{
    [Space(10)] public KinematicCharacterMotor Motor;
    // Start is called before the first frame update

    [Header("Stable Movement")] public float MaxStableMoveSpeed = 10f;
    public float StableMovementSharpness = 15f;
    public float OrientationSharpness = 10f;

    [Header("Air Movement")] public float MaxAirMoveSpeed = 100f;
    public float AirAccelerationSpeed = 15f;
    public float Drag = 0.1f;

    [Header("Misc")] public Vector3 Gravity = new Vector3(0, -30f, 0);
    private Vector3 _moveInputVector;
    private Vector3 _lookInputVector;
    private float _lookAheadDistance;

    void Start()
    {
        Motor.CharacterController = this;
    }


    public void SetInputs(ref AICharacterInputs inputs)
    {
        _moveInputVector = inputs.MoveVector;
        _lookInputVector = _moveInputVector.normalized;
        _lookAheadDistance = inputs.lookAheadDistance;
    }

    public void UpdateRotation(ref Quaternion currentRotation, float deltaTime)
    {
        if (_lookInputVector != Vector3.zero && OrientationSharpness > 0f)
        {
            // Smoothly interpolate from current to target look direction
            Vector3 smoothedLookInputDirection = Vector3.Slerp(Motor.CharacterForward, _lookInputVector,
                1 - Mathf.Exp(-OrientationSharpness * deltaTime)).normalized;

            // Set the current rotation (which will be used by the KinematicCharacterMotor)
            currentRotation = Quaternion.LookRotation(smoothedLookInputDirection, Motor.CharacterUp);
        }
    }

    public void UpdateVelocity(ref Vector3 currentVelocity, float deltaTime)
    {
        if (AvoidObstacles())
            MaxStableMoveSpeed = 0f;
        else
        {
            MaxStableMoveSpeed = 5f;
        }

        // Ground movement
        if (Motor.GroundingStatus.IsStableOnGround)
        {
            float currentVelocityMagnitude = currentVelocity.magnitude;

            Vector3 effectiveGroundNormal = Motor.GroundingStatus.GroundNormal;
            if (currentVelocityMagnitude > 0f && Motor.GroundingStatus.SnappingPrevented)
            {
                // Take the normal from where we're coming from
                Vector3 groundPointToCharacter = Motor.TransientPosition - Motor.GroundingStatus.GroundPoint;
                if (Vector3.Dot(currentVelocity, groundPointToCharacter) >= 0f)
                {
                    effectiveGroundNormal = Motor.GroundingStatus.OuterGroundNormal;
                }
                else
                {
                    effectiveGroundNormal = Motor.GroundingStatus.InnerGroundNormal;
                }
            }

            // Reorient velocity on slope
            currentVelocity = Motor.GetDirectionTangentToSurface(currentVelocity, effectiveGroundNormal) *
                              currentVelocityMagnitude;

            // Calculate target velocity
            Vector3 inputRight = Vector3.Cross(_moveInputVector, Motor.CharacterUp);
            Vector3 reorientedInput =
                Vector3.Cross(effectiveGroundNormal, inputRight).normalized * _moveInputVector.magnitude;
            Vector3 targetMovementVelocity = reorientedInput * MaxStableMoveSpeed;

            // Smooth movement Velocity
            currentVelocity = Vector3.Lerp(currentVelocity, targetMovementVelocity,
                1f - Mathf.Exp(-StableMovementSharpness * deltaTime));
        }
        // Air movement
        else
        {
            // Add move input
            if (_moveInputVector.sqrMagnitude > 0f)
            {
                Vector3 addedVelocity = _moveInputVector * AirAccelerationSpeed * deltaTime;

                // Prevent air movement from making you move up steep sloped walls
                if (Motor.GroundingStatus.FoundAnyGround)
                {
                    Vector3 perpenticularObstructionNormal = Vector3
                        .Cross(Vector3.Cross(Motor.CharacterUp, Motor.GroundingStatus.GroundNormal), Motor.CharacterUp)
                        .normalized;
                    addedVelocity = Vector3.ProjectOnPlane(addedVelocity, perpenticularObstructionNormal);
                }

                // Limit air movement from inputs to a certain maximum, without limiting the total air move speed from momentum, gravity or other forces
                Vector3 resultingVelOnInputsPlane =
                    Vector3.ProjectOnPlane(currentVelocity + addedVelocity, Motor.CharacterUp);
                if (resultingVelOnInputsPlane.magnitude > MaxAirMoveSpeed &&
                    Vector3.Dot(_moveInputVector, resultingVelOnInputsPlane) >= 0f)
                {
                    addedVelocity = Vector3.zero;
                }
                else
                {
                    Vector3 velOnInputsPlane = Vector3.ProjectOnPlane(currentVelocity, Motor.CharacterUp);
                    Vector3 clampedResultingVelOnInputsPlane =
                        Vector3.ClampMagnitude(resultingVelOnInputsPlane, MaxAirMoveSpeed);
                    addedVelocity = clampedResultingVelOnInputsPlane - velOnInputsPlane;
                }

                currentVelocity += addedVelocity;
            }

            // Gravity
            currentVelocity += Gravity * deltaTime;

            // Drag
            currentVelocity *= (1f / (1f + (Drag * deltaTime)));
        }
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

    public void OnGroundHit(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint,
        ref HitStabilityReport hitStabilityReport)
    {
    }

    public void OnMovementHit(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint,
        ref HitStabilityReport hitStabilityReport)
    {
    }

    public void ProcessHitStabilityReport(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint,
        Vector3 atCharacterPosition,
        Quaternion atCharacterRotation, ref HitStabilityReport hitStabilityReport)
    {
    }

    public void OnDiscreteCollisionDetected(Collider hitCollider)
    {
    }

    private bool AvoidObstacles()
    {
        Vector3 castStart = transform.position + transform.up * Motor.Capsule.height +
                            transform.forward * Motor.Capsule.radius;
        //float castAngle = Mathf.Atan(_lookAheadDistance / Motor.Capsule.height);
        Vector3 castEnd = transform.position + transform.forward * Motor.Capsule.radius +
                          transform.forward * _lookAheadDistance;
        Vector3 dir = (castEnd - castStart);
        RaycastHit groundHit;
        RaycastHit spikeHit;
        Physics.Raycast(castStart, dir.normalized, out groundHit, dir.magnitude + 0.2f);
        Physics.Raycast(castStart - transform.up * Motor.Capsule.height / 2f, transform.forward * _lookAheadDistance,
            out spikeHit, _lookAheadDistance);
        Color c = Color.green;

        if (groundHit.collider == null || (spikeHit.collider != null && spikeHit.collider.CompareTag("Spike")))
        {
            c = Color.red;
        }

        Debug.DrawRay(castStart, dir, c);
        Debug.DrawRay(castStart - transform.up * Motor.Capsule.height / 2f, transform.forward * _lookAheadDistance, c);
        return groundHit.collider == null || (spikeHit.collider != null && spikeHit.collider.CompareTag("Spike"));
    }
}