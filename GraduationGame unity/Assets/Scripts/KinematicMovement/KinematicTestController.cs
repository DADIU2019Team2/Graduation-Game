using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;
using System;

namespace KinematicTest.controller
{
    enum PlayerStates
    {
        Running,
        Stopped,
        Sliding,
    }

    public struct PlayerCharacterInputs
    {
        //public string inputString;
        public bool jumpDown;
        public bool changeDirection;
    }

    public class KinematicTestController : MonoBehaviour, ICharacterController
    {
        public KinematicCharacterMotor Motor;

        bool canChangedirection = true;
        bool isRunningRight = true;
        bool rampingDown;
        float curveStep;
        float rampUpTime = 2f;
        float rampDownTime = 0.5f;
        bool stopped = false;
        public PlayerControllerSettings settings;
        AnimationCurve rampUpCurve; //speed curve
        AnimationCurve rampDownCurve;
        CharacterController controller;
        
        public static int runningRight = 1;
        [Header("Running Movement")] public float MaxStableMoveSpeed = 10f;
        public float StableMovementSharpness = 15;
        public float OrientationSharpness = 10;

        [Header("Jumping Related Stuff")] public bool _jumpedThisFrame;
        public float hangTimeVelocityThreshold;
        public bool _jumpRequested;
        private bool _jumpConsumed;
        private float _timeSinceJumpRequested;
        public float JumpSpeed = 10f;
        public float desiredJumpHeight;
        public float JumpPreGroundingGraceTime = 0f;
        public float JumpPostGroundingGraceTime = 0f;

        [Header("Air Movement")] public float MaxAirMoveSpeed = 10f;
        public float AirAccelerationSpeed = 5f;
        public float Drag = 0.1f;

        [Header("Misc")] public bool RotationObstruction;
        public Vector3 Gravity = new Vector3(0, -10f, 0);
        public Vector3 baseGravity = new Vector3(0, -10f, 0);
        public float floatGravity;
        public float upGravity = 3f;
        public float downGravity;
        public Transform MeshRoot;
        public bool AllowDoubleJump;
        public bool AllowJumpingWhenSliding;
        private bool _doubleJumpConsumed;
        private Vector3 _moveInputVector;
        private Vector3 _lookInputVector;
        private string _inputString;
        private float _timeSinceLastAbleToJump = 0f;
        void Init()
        {
            rampUpTime = settings.rampUpTime;
            rampDownTime = settings.rampDownTime;
            rampUpCurve = settings.rampUpCurve;
            rampDownCurve = settings.rampDownCurve;
            baseGravity = new Vector3(0f,-settings.baseGravity, 0f);
            upGravity = settings.riseGravity;
            floatGravity = settings.hangGravity;
            downGravity = settings.fallGravity;
            hangTimeVelocityThreshold = settings.hangTimeVelocityCutoff;
            //Gravity = new Vector3();
            JumpSpeed = GetJumpSpeedFromHeight(-Gravity.y, desiredJumpHeight);
        }

        private void Start()
        {
            // Assign to motor
            Motor.CharacterController = this;
            Init();
        }

        /// <summary>
        /// This is called every frame by MyPlayer in order to tell the character what its inputs are
        /// </summary>
        public void SetInputs(ref PlayerCharacterInputs inputs)
        {
            if (canChangedirection && inputs.changeDirection)
            {
                if (stopped)
                {
                    stopped = false;
                    rampingDown = false;
                    curveStep = 0;
                }
                else
                {
                    curveStep = 1 - curveStep;
                    rampingDown = true;
                }

                //isRunningRight = !isRunningRight;
            }

            //runningRight = isRunningRight ? 1 : -1 ;
            // Clamp input
            //Vector3 moveInputVector = Vector3.ClampMagnitude(new Vector3(inputs.MoveAxisRight, 0f, inputs.MoveAxisForward), 1f);
            Vector3 moveInputVector = Vector3.right * runningRight;
            // Move and look inputs
            _moveInputVector = moveInputVector;
            
            if (inputs.jumpDown)
            {
                _timeSinceJumpRequested = 0f;
                _jumpRequested = true;
            }
        }

        /// <summary>
        /// (Called by KinematicCharacterMotor during its update cycle)
        /// This is called before the character begins its movement update
        /// </summary>
        public void BeforeCharacterUpdate(float deltaTime)
        {
        }

        /// <summary>
        /// (Called by KinematicCharacterMotor during its update cycle)
        /// This is where you tell your character what its rotation should be right now. 
        /// This is the ONLY place where you should set the character's rotation
        /// </summary>
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

        /// <summary>
        /// (Called by KinematicCharacterMotor during its update cycle)
        /// This is where you tell your character what its velocity should be right now. 
        /// This is the ONLY place where you can set the character's velocity
        /// </summary>
        public void UpdateVelocity(ref Vector3 currentVelocity, float deltaTime)
        {
            Vector3 targetMovementVelocity = Vector3.zero;
            if (Motor.GroundingStatus.IsStableOnGround)
            {
                // Reorient source velocity on current ground slope (this is because we don't want our smoothing to cause any velocity losses in slope changes)
                currentVelocity =
                    Motor.GetDirectionTangentToSurface(currentVelocity, Motor.GroundingStatus.GroundNormal) *
                    currentVelocity.magnitude;

                // Calculate target velocity
                Vector3 inputRight = Vector3.Cross(_moveInputVector, Motor.CharacterUp);
                Vector3 reorientedInput = Vector3.Cross(Motor.GroundingStatus.GroundNormal, inputRight).normalized *
                                          _moveInputVector.magnitude;
                float velocity = 0f;

                if (rampingDown)
                {
                    if (curveStep < 1)
                    {
                        curveStep += (1 / rampDownTime * Time.deltaTime);
                    }

                    if (curveStep >= 1)
                    {
                        curveStep = 0;
                        rampingDown = false;
                        runningRight = runningRight * -1;
                    }
                }
                else
                {
                    if (curveStep < 1)
                    {
                        curveStep += (1 / rampUpTime * Time.deltaTime);
                    }

                    if (curveStep > 1)
                    {
                        curveStep = 1;
                    }
                }

                if (!stopped)
                {
                    Debug.Log("not stopped");
                    if (rampingDown)
                    {
                        velocity = MaxStableMoveSpeed * rampDownCurve.Evaluate(curveStep);
                    }
                    else
                    {
                        velocity = MaxStableMoveSpeed * rampUpCurve.Evaluate(curveStep);
                    }
                }


                targetMovementVelocity = reorientedInput * velocity;

                // Smooth movement Velocity
                currentVelocity = Vector3.Lerp(currentVelocity, targetMovementVelocity,
                    1 - Mathf.Exp(-StableMovementSharpness * deltaTime));
            }
            else
            {
                // Add move input
                if (_moveInputVector.sqrMagnitude > 0f)
                {
                    targetMovementVelocity = _moveInputVector * MaxAirMoveSpeed;

                    // Prevent climbing on un-stable slopes with air movement
                    if (Motor.GroundingStatus.FoundAnyGround)
                    {
                        Vector3 perpenticularObstructionNormal = Vector3
                            .Cross(Vector3.Cross(Motor.CharacterUp, Motor.GroundingStatus.GroundNormal),
                                Motor.CharacterUp).normalized;
                        targetMovementVelocity =
                            Vector3.ProjectOnPlane(targetMovementVelocity, perpenticularObstructionNormal);
                    }

                    Vector3 velocityDiff = Vector3.ProjectOnPlane(targetMovementVelocity - currentVelocity, Gravity);
                    currentVelocity += velocityDiff * AirAccelerationSpeed * deltaTime;
                }
                //Variable gravity
                /*Gravity = baseGravity * upGravity;
                if (currentVelocity.y <= hangTimeVelocityThreshold && currentVelocity.y > 0f)
                {
                    Gravity = baseGravity * floatGravity;
                }
                else if (currentVelocity.y < -hangTimeVelocityThreshold)
                {
                    Gravity = baseGravity * downGravity;
                }*/
                
                // Gravity
                currentVelocity += Gravity * deltaTime;

                // Drag
                currentVelocity *= (1f / (1f + (Drag * deltaTime)));
            }

            {
                _jumpedThisFrame = false;
                _timeSinceJumpRequested += deltaTime;
                if (_jumpRequested)
                {
                    // Handle double jump
                    if (AllowDoubleJump)
                    {
                        if (_jumpConsumed && !_doubleJumpConsumed && (AllowJumpingWhenSliding
                                ? !Motor.GroundingStatus.FoundAnyGround
                                : !Motor.GroundingStatus.IsStableOnGround))
                        {
                            Motor.ForceUnground(0.1f);

                            // Add to the return velocity and reset jump state
                            currentVelocity += (Motor.CharacterUp * JumpSpeed) -
                                               Vector3.Project(currentVelocity, Motor.CharacterUp);
                            _jumpRequested = false;
                            _doubleJumpConsumed = true;
                            _jumpedThisFrame = true;
                        }
                    }

                    // See if we actually are allowed to jump
                    if (
                        (!_jumpConsumed &&
                         ((AllowJumpingWhenSliding
                              ? Motor.GroundingStatus.FoundAnyGround
                              : Motor.GroundingStatus.IsStableOnGround) ||
                          _timeSinceLastAbleToJump <= JumpPostGroundingGraceTime)))
                    {
                        // Calculate jump direction before ungrounding
                        Vector3 jumpDirection = Motor.CharacterUp;
                        if (Motor.GroundingStatus.FoundAnyGround && !Motor.GroundingStatus.IsStableOnGround)
                        {
                            jumpDirection = Motor.GroundingStatus.GroundNormal;
                        }

                        // Makes the character skip ground probing/snapping on its next update. 
                        // If this line weren't here, the character would remain snapped to the ground when trying to jump. Try commenting this line out and see.
                        Motor.ForceUnground(0.1f);

                        // Add to the return velocity and reset jump state
                        currentVelocity += (jumpDirection * JumpSpeed) -
                                           Vector3.Project(currentVelocity, Motor.CharacterUp);
                        _jumpRequested = false;
                        _jumpConsumed = true;
                        _jumpedThisFrame = true;
                    }
                }
            }
        }

        /// <summary>
        /// (Called by KinematicCharacterMotor during its update cycle)
        /// This is called after the character has finished its movement update
        /// </summary>
        public void AfterCharacterUpdate(float deltaTime)
        {
            // Handle jump-related values
            {
                // Handle jumping pre-ground grace period
                if (_jumpRequested && _timeSinceJumpRequested > JumpPreGroundingGraceTime)
                {
                    _jumpRequested = false;
                }

                if (AllowJumpingWhenSliding
                    ? Motor.GroundingStatus.FoundAnyGround
                    : Motor.GroundingStatus.IsStableOnGround)
                {
                    // If we're on a ground surface, reset jumping values
                    if (!_jumpedThisFrame)
                    {
                        _doubleJumpConsumed = false;
                        _jumpConsumed = false;
                    }

                    _timeSinceLastAbleToJump = 0f;
                }
                else
                {
                    // Keep track of time since we were last able to jump (for grace period)
                    _timeSinceLastAbleToJump += deltaTime;
                }
            }
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

        public void PostGroundingUpdate(float deltaTime)
        {
            // Handle landing and leaving ground
            if (Motor.GroundingStatus.IsStableOnGround && !Motor.LastGroundingStatus.IsStableOnGround)
            {
                OnLanded();
            }
            else if (!Motor.GroundingStatus.IsStableOnGround && Motor.LastGroundingStatus.IsStableOnGround)
            {
                OnLeaveStableGround();
            }
        }

        protected void OnLanded()
        {
            Debug.Log("Landed");
        }

        protected void OnLeaveStableGround()
        {
            Debug.Log("Left ground");
        }

        public void AddVelocity(Vector3 velocity)
        {
        }

        public void ProcessHitStabilityReport(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint,
            Vector3 atCharacterPosition, Quaternion atCharacterRotation, ref HitStabilityReport hitStabilityReport)
        {
        }

        public void OnDiscreteCollisionDetected(Collider hitCollider)
        {
        }

        public float GetJumpSpeedFromHeight(float grav, float jumpHeight)
        {
            return Mathf.Sqrt(2f * grav * jumpHeight);
        }
        public static bool GetIsRunningRight()
        {

            if (runningRight == 1)
            {
                return true;
            }
            else
            {
                return false;
            } 
        
    }
}