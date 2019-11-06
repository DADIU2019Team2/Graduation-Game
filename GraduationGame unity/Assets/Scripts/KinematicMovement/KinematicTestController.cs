using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;
using System;
using KinematicCharacterController.Examples;

namespace KinematicTest.controller
{
    public enum PlayerStates
    {
        Running,
        Idling,
        Sliding,
        LedgeGrabbing,
    }

    public struct PlayerCharacterInputs
    {
        //public string inputString;
        public bool jumpDown;
        public bool slideDown;
        public bool ledgeGrabHold;
        public bool changeDirection;
        public bool crouchDown;
        public bool crouchUp;
    }

    public class KinematicTestController : MonoBehaviour, ICharacterController
    {
        [Space(10)] public bool updateSettingsLive = true;

        [Space(10)] public KinematicCharacterMotor Motor;
        //public GameObject scarf;

        // Gravity
        private Vector3 baseGravity = new Vector3(0, -10f, 0);
        private float hangGravity;
        private float riseGravity = 3f;
        private float fallGravity;
        private float dropGravity;

        // Movement tweaks
        private float curveStep;
        private float rampUpTime = 2f;
        private float rampDownTime = 0.5f;
        private bool stopped;
        private bool rampingDown;
        private bool isRunningRight = true;
        private bool canChangedirection = true;
        public static int runningRight = 1;
        private AnimationCurve rampUpCurve; //speed curve
        private AnimationCurve rampDownCurve;

        // Running
        private float MaxStableMoveSpeed;
        private float StableMovementSharpness;
        private float OrientationSharpness = 10;
        private Vector3 lastVelocityBeforeJump;

        // Jumping
        private bool AllowDoubleJump;
        private bool AllowJumpingWhenSliding;
        private bool _doubleJumpConsumed;
        private Vector3 _moveInputVector;
        private Vector3 _lookInputVector;
        private string _inputString;
        private float _timeSinceLastAbleToJump = 0f;
        private bool jumpInitiated;
        private bool _jumpedThisFrame;
        private float hangTimeVelocityThreshold;
        private bool _jumpRequested;
        private bool _jumpConsumed;
        private float _timeSinceJumpRequested;
        private float JumpSpeed;
        private float desiredJumpHeight;
        private float JumpPreGroundingGraceTime = 0f;
        private float JumpPostGroundingGraceTime = 0f;

        // Air movement
        private float MaxAirMoveSpeed;
        private float AirAccelerationSpeed;
        private float Drag = 0.1f;

        // Sliding
        private float _timeSinceStartedSliding;
        private float _slideCurveStep;
        private float _slideEndSpeed;
        private bool _isStoppedSliding;
        private Collider[] _probedColliders = new Collider[8];
        private bool _shouldBeCrouching;

        private bool _isCrouching;

        // Settings
        public PlayerControllerSettings settings;

        // Debug stuff
        public PlayerStates CurrentCharacterState;
        public Vector3 Gravity = new Vector3(0, -10f, 0);
        public Transform MeshRoot;

        //This will later be scriptable object
        [Header("Sound settings")] public AK.Wwise.Event jumpSound;

        public AK.Wwise.Event landSound;
        bool canChangeMidAir = true;

        void Init()
        {
            canChangeMidAir = settings.canChangeDirectionsMidair;
            rampUpTime = settings.rampUpTime;
            rampDownTime = settings.rampDownTime;
            rampUpCurve = settings.rampUpCurve;
            rampDownCurve = settings.rampDownCurve;
            baseGravity = new Vector3(0f, -settings.baseGravity, 0f);
            riseGravity = settings.riseGravityMultiplier;
            hangGravity = settings.hangGravityMultiplier;
            fallGravity = settings.fallGravityMultiplier;
            dropGravity = settings.dropGravityMultiplier;
            hangTimeVelocityThreshold = settings.hangTimeVelocityThreshold;


            StableMovementSharpness = settings.StableMovementSharpness;
            OrientationSharpness = settings.OrientationSharpness;
            MaxStableMoveSpeed = settings.maxMoveSpeed;
            StableMovementSharpness = settings.StableMovementSharpness;

            desiredJumpHeight = settings.jumpHeight * Motor.Capsule.height;

            JumpSpeed = Mathf.Sqrt(2 * riseGravity * desiredJumpHeight * settings.baseGravity);

            JumpPreGroundingGraceTime = settings.JumpPreGroundingGraceTime;
            JumpPostGroundingGraceTime = settings.JumpPostGroundingGraceTime;

            MaxAirMoveSpeed = settings.maxAirMoveSpeed;
            Drag = 0.1f;

            AllowDoubleJump = settings.AllowDoubleJump;
            AllowJumpingWhenSliding = settings.AllowJumpingWhenSliding;
        }

        private void Start()
        {
            // Assign to motor
            Motor.CharacterController = this;
            Init();
        }


        public void TransitionToState(PlayerStates newState)
        {
            PlayerStates tmpInitialState = CurrentCharacterState;
            OnStateExit(tmpInitialState, newState);
            CurrentCharacterState = newState;
            OnStateEnter(newState, tmpInitialState);
        }

        /// <summary>
        /// Event when entering a state
        /// </summary>
        public void OnStateEnter(PlayerStates state, PlayerStates fromState)
        {
            switch (state)
            {
                case PlayerStates.Running:
                {
                    MaxAirMoveSpeed = settings.maxAirMoveSpeed;
                    MaxStableMoveSpeed = settings.maxMoveSpeed;
                    JumpSpeed = Mathf.Sqrt(2 * riseGravity * settings.jumpHeight * settings.baseGravity *
                                           Motor.Capsule.height);
                    break;
                }
                case PlayerStates.Idling:
                {
                    stopped = true;
                    rampingDown = false;
                    MaxAirMoveSpeed = settings.idleAirMoveSpeed;
                    MaxStableMoveSpeed = 0f;
                    curveStep = 0f;
                    JumpSpeed = Mathf.Sqrt(2 * riseGravity * settings.idleJumpHeight * settings.baseGravity *
                                           Motor.Capsule.height);
                    break;
                }
                case PlayerStates.Sliding:
                {
                    canChangedirection = false;
                    _isStoppedSliding = false;
                    MaxAirMoveSpeed = settings.slideMoveSpeed;
                    MaxStableMoveSpeed = settings.slideMoveSpeed;
                    curveStep = 0f;
                    JumpSpeed = Mathf.Sqrt(2 * riseGravity * settings.slideJumpHeight * settings.baseGravity *
                                           Motor.Capsule.height);

                    _shouldBeCrouching = true;

                    if (!_isCrouching)
                    {
                        _isCrouching = true;
                        Motor.SetCapsuleDimensions(0.5f, 1f, 0.5f);
                        MeshRoot.localScale = new Vector3(1.2f, 0.5f, 1.2f);
                    }

                    break;
                }
                case PlayerStates.LedgeGrabbing:
                {
                    break;
                }
            }
        }

        /// <summary>
        /// Event when exiting a state
        /// </summary>
        public void OnStateExit(PlayerStates state, PlayerStates toState)
        {
            switch (state)
            {
                case PlayerStates.Running:
                {
                    break;
                }
                case PlayerStates.Idling:
                {
                    break;
                }
                case PlayerStates.Sliding:
                {
                    Motor.SetCapsuleDimensions(0.5f, 2f, 1f);
                    MeshRoot.localScale = new Vector3(1f, 1f, 1f);
                    _isCrouching = false;
                    _isStoppedSliding = true;
                    _timeSinceStartedSliding = 0f;
                    canChangedirection = true;
                    break;
                }
            }
        }

        /// <summary>
        /// This is called every frame by MyPlayer in order to tell the character what its inputs are
        /// </summary>
        public void SetInputs(ref PlayerCharacterInputs inputs)
        {
            if (inputs.slideDown && CurrentCharacterState == PlayerStates.Running &&
                Motor.GroundingStatus.FoundAnyGround)
            {
                TransitionToState(PlayerStates.Sliding);
            }

            if (inputs.crouchDown)
            {
                MeshRoot.localScale = new Vector3(1.2f, 0.5f, 1.2f);
            }

            if (inputs.crouchUp)
            {
                MeshRoot.localScale = new Vector3(1f, 1f, 1f);
            }

            if (canChangedirection && inputs.changeDirection)
            {
                if (CurrentCharacterState == PlayerStates.Idling)
                    TransitionToState(PlayerStates.Running);
                if (stopped)
                {
                    stopped = false;
                    rampingDown = false;
                    curveStep = 0;
                    runningRight *= -1;
                    //scarf.transform.Rotate(Vector3.up, 180);
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
            switch (CurrentCharacterState)
            {
                case PlayerStates.Sliding:
                {
                    _timeSinceStartedSliding += deltaTime;
                    if (settings.decelerateWhileSliding)
                    {
                        _slideCurveStep = _timeSinceStartedSliding / settings.slideDuration;
                    }

                    break;
                }
            }
        }

        /// <summary>
        /// (Called by KinematicCharacterMotor during its update cycle)
        /// This is where you tell your character what its rotation should be right now. 
        /// This is the ONLY place where you should set the character's rotation
        /// </summary>
        public void UpdateRotation(ref Quaternion currentRotation, float deltaTime)
        {
            if (updateSettingsLive)
            {
                Init();
            }

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
                Gravity = riseGravity * baseGravity;
                // Reorient source velocity on current ground slope (this is because we don't want our smoothing to cause any velocity losses in slope changes)
                currentVelocity =
                    Motor.GetDirectionTangentToSurface(currentVelocity, Motor.GroundingStatus.GroundNormal) *
                    currentVelocity.magnitude;

                // Calculate target velocity
                Vector3 inputRight = Vector3.Cross(_moveInputVector, Motor.CharacterUp);
                Vector3 reorientedInput = Vector3.Cross(Motor.GroundingStatus.GroundNormal, inputRight).normalized *
                                          _moveInputVector.magnitude;
                float velocity = 0f;

                switch (CurrentCharacterState)
                {
                    case PlayerStates.Running:
                    {
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
                                //scarf.transform.Rotate(Vector3.up, 180);
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

                        break;
                    }
                    case PlayerStates.Sliding:
                    {
                        if (settings.decelerateWhileSliding)
                        {
                            velocity = settings.slideMoveSpeed * settings.slideCurve.Evaluate(_slideCurveStep);
                        }
                        else
                        {
                            velocity = Mathf.Min(settings.slideMoveSpeed, currentVelocity.magnitude);
                        }

                        break;
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

                    switch (CurrentCharacterState)
                    {
                        case PlayerStates.Running:
                        {
                            if (canChangeMidAir)
                            {
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
                                        //scarf.transform.Rotate(Vector3.up, 180);
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
                                        AirAccelerationSpeed = MaxAirMoveSpeed * rampDownCurve.Evaluate(curveStep);
                                    }
                                    else
                                    {
                                        AirAccelerationSpeed = MaxAirMoveSpeed * rampUpCurve.Evaluate(curveStep);
                                    }
                                }
                            }
                            else
                            {
                                // this is where the prevvel goes
                                targetMovementVelocity = lastVelocityBeforeJump;
                                Debug.Log(lastVelocityBeforeJump.magnitude);
                            }

                            break;
                        }
                        case PlayerStates.Idling:
                        {
                            targetMovementVelocity = _moveInputVector * MaxAirMoveSpeed;
                            AirAccelerationSpeed = MaxAirMoveSpeed;
                            break;
                        }
                        case PlayerStates.Sliding:
                        {
                            targetMovementVelocity = lastVelocityBeforeJump;
                            Debug.Log(lastVelocityBeforeJump.magnitude);
                            break;
                        }
                    }


                    Vector3 velocityDiff = Vector3.ProjectOnPlane(targetMovementVelocity - currentVelocity, Gravity);
                    currentVelocity += velocityDiff * AirAccelerationSpeed * deltaTime;
                }

                //Calculate variable gravity
                Gravity = dropGravity * baseGravity;
                if (jumpInitiated)
                {
                    if (currentVelocity.y < 0f)
                        Gravity = hangGravity * baseGravity;
                    if (currentVelocity.y < -hangTimeVelocityThreshold)
                        Gravity = fallGravity * baseGravity;
                }

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
                        jumpInitiated = true;
                        jumpSound.Post(gameObject);
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

                switch (CurrentCharacterState)
                {
                    case PlayerStates.Sliding:
                    {
                        if (!_isStoppedSliding && _timeSinceStartedSliding > settings.slideDuration)
                        {
                            _shouldBeCrouching = false;
                        }

                        if (_isCrouching && !_shouldBeCrouching && Motor.GroundingStatus.IsStableOnGround)
                        {
                            // Do an overlap test with the character's standing height to see if there are any obstructions
                            Motor.SetCapsuleDimensions(0.5f, 2f, 1f);
                            if (Motor.CharacterOverlap(
                                    Motor.TransientPosition,
                                    Motor.TransientRotation,
                                    _probedColliders,
                                    Motor.CollidableLayers,
                                    QueryTriggerInteraction.Ignore) > 0)
                            {
                                // If obstructions, just stick to crouching dimensions
                                Motor.SetCapsuleDimensions(0.5f, 1f, 0.5f);
                            }
                            else
                            {
                                // If no obstructions, uncrouch
                                TransitionToState(PlayerStates.Running);
                                _isStoppedSliding = true;
                            }
                        }


                        break;
                    }
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
            if (hitCollider.CompareTag("MovingPlatform"))
            {
                //code
            }
        }

        public void OnMovementHit(Collider hitCollider, Vector3 hitNormal, Vector3 hitPoint,
            ref HitStabilityReport hitStabilityReport)
        {
            if (hitCollider.CompareTag("Ledge"))
            {
                Debug.Log("Ledge");
            }

            if (hitCollider.CompareTag("Wall") && CurrentCharacterState != PlayerStates.Idling &&
                Motor.GroundingStatus.IsStableOnGround && !rampingDown)
            {
                if (rampingDown)
                {
                    curveStep = 0;
                    rampingDown = false;
                    //runningRight = runningRight * -1;
                    //scarf.transform.Rotate(Vector3.up, 180);
                }

                Debug.Log("Tranisitioning");
                TransitionToState(PlayerStates.Idling);
            }
            else if (hitCollider.CompareTag("MovingPlatform"))
            {
                hitCollider.GetComponent<MovingPlatform>().activatePlatform();
            }
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
            landSound.Post(gameObject);
            canChangedirection = true;
            jumpInitiated = false;
            Debug.Log("Landed");

            if (CurrentCharacterState == PlayerStates.Idling)
            {
                stopped = false;
                TransitionToState(PlayerStates.Running);
            }

            if (CurrentCharacterState == PlayerStates.Sliding)
            {
                //??
                _slideEndSpeed =
                    (Motor.GetDirectionTangentToSurface(Motor.Velocity, Motor.GroundingStatus.GroundNormal) *
                     Motor.Velocity.magnitude).magnitude;
                Debug.Log(_slideEndSpeed);
            }
        }

        protected void OnLeaveStableGround()
        {
            if (canChangeMidAir && CurrentCharacterState != PlayerStates.Sliding)
            {
                canChangedirection = true;
            }
            else
            {
                lastVelocityBeforeJump = Motor.Velocity;
                canChangedirection = false;
            }

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
}