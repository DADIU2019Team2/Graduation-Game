using System;
using System.Collections;
using System.Collections.Generic;
using KinematicCharacterController;
using MiniGame2.Events;
using UnityEngine;

public struct AICharacterInputs
{
    public Vector3 MoveVector;
    public float lookAheadDistance;
}

public enum AIStates
{
    Idling,
    Chasing,
}

public class AICharacterController : MonoBehaviour, ICharacterController, IOnSceneReset
{
    [Space(10)] public KinematicCharacterMotor Motor;

    public AISettings settings;

    private float MaxStableMoveSpeed;
    private float StableMovementSharpness;
    private float OrientationSharpness;

    [Header("Air Movement")] private float MaxAirMoveSpeed;
    private float AirAccelerationSpeed;
    private float Drag = 0.1f;

    [Header("Misc")] public Vector3 Gravity = new Vector3(0, -30f, 0);
    private Vector3 _moveInputVector;
    private Vector3 _lookInputVector;
    private float _lookAheadDistance;
    private bool _avoidObstacles;
    private Vector3 _spawnPoint;
    private bool isActive;
    public AIStates CurrentAIState;

    //Player Damage
    public IntVariable damage;

    private void Awake()
    {
        _spawnPoint = transform.position;
    }

    void Start()
    {
        Init();
        Motor.CharacterController = this;
        GameManager.GameStateChangeEvent += DetermineAIState;
    }

    void Init()
    {
        MaxStableMoveSpeed = settings.MaxStableMoveSpeed;
        StableMovementSharpness = settings.StableMovementSharpness;
        OrientationSharpness = settings.OrientationSharpness;
        MaxAirMoveSpeed = settings.MaxAirMoveSpeed;
        AirAccelerationSpeed = settings.AirAccelerationSpeed;
    }

    public void TransitionToState(AIStates newState)
    {
        if (CurrentAIState == newState)
            return;
        AIStates tmpInitialState = CurrentAIState;
        OnStateExit(tmpInitialState, newState);
        CurrentAIState = newState;
        OnStateEnter(newState, tmpInitialState);
    }

    private void DetermineAIState(GameStateScriptableObject.GameState currentGameState)
    {
        switch (currentGameState)
        {
            case GameStateScriptableObject.GameState.mainGameplayLoop:
                TransitionToState(AIStates.Chasing);
                break;
            default:
                TransitionToState(AIStates.Idling);
                break;
        }
    }

    private void OnStateEnter(AIStates state, AIStates fromState)
    {
        switch (state)
        {
            case AIStates.Idling:
            {
                MaxStableMoveSpeed = 0f;
                break;
            }
            case AIStates.Chasing:
            {
                MaxStableMoveSpeed = settings.MaxStableMoveSpeed;
                break;
            }
        }
    }

    private void OnStateExit(AIStates state, AIStates toState)
    {
        switch (state)
        {
            case AIStates.Idling:
            {
                break;
            }
            case AIStates.Chasing:
            {
                break;
            }
        }
    }

    public void SetInputs(ref AICharacterInputs inputs)
    {
        if (!isActive)
        {
            return;
        }

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
        if (GameManager.GetGameState() != GameStateScriptableObject.GameState.mainGameplayLoop) return;
        if (!isActive)
        {
            if (CurrentAIState != AIStates.Idling)
            {
                TransitionToState(AIStates.Idling);
            }

            isActive = LookForPlayer();
        }
        else
        {
            _avoidObstacles = AvoidObstacles();
            TransitionToState(_avoidObstacles ? AIStates.Idling : AIStates.Chasing);
        }
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
        Transform copTransform = transform;
        Vector3 position = copTransform.position;
        Vector3 forward = copTransform.forward;
        Vector3 up = copTransform.up;
        float radius;
        Vector3 castStart = position + up * Motor.Capsule.height +
                            forward * (radius = Motor.Capsule.radius);
        //float castAngle = Mathf.Atan(_lookAheadDistance / Motor.Capsule.height);
        Vector3 castEnd = position + forward * radius +
                          forward * _lookAheadDistance;
        Vector3 dir = (castEnd - castStart);
        Physics.Raycast(castStart, dir.normalized, out var groundHit, dir.magnitude + 0.2f);
        Physics.Raycast(castStart - up * (Motor.Capsule.height / 2f), transform.forward * _lookAheadDistance,
            out var spikeHit, _lookAheadDistance);
        return groundHit.collider == null || (spikeHit.collider != null && spikeHit.collider.CompareTag("Spike"));
    }

    private bool LookForPlayer()
    {
        Transform copTransform = transform;
        Vector3 castStart = copTransform.position + copTransform.up * (Motor.Capsule.height / 2f);
        Vector3 forward = copTransform.forward;
        
        Physics.Raycast(castStart, forward * settings.searchRange, out var forwardHit, settings.searchRange);
        Physics.Raycast(castStart, -forward * settings.searchRange, out var backHit, settings.searchRange);
        return ((forwardHit.collider != null && forwardHit.collider.CompareTag("Player")) ||
                (backHit.collider != null && backHit.collider.CompareTag("Player")));
    }

    public void OnResetLevel()
    {
        Motor.SetPosition(_spawnPoint);
        Motor.SetRotation(Quaternion.Euler(0f, 90f, 0f));
        isActive = false;
    }

    void OnGameStateChange(GameStateScriptableObject.GameState currentGameState)
    {
    }
}