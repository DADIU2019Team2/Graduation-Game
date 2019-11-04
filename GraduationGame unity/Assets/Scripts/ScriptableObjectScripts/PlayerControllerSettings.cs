using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObject/Player/PlayerSettings")]
public class PlayerControllerSettings : ScriptableObject
{
    public float rampUpTime;
    public float rampDownTime;
    public float maxSpeed;
    public float baseGravity;
    public float hangTimeVelocityCutoff;
    [Header("Gravity Settings")]
    [Tooltip("Gravity affecting the player while jumping up")]
    public float riseGravity;
    [Tooltip("Gravity affecting the player while hanging mid-jump")]
    public float hangGravity;
    [Tooltip("Gravity affecting the player while falling from jumping")]
    public float fallGravity;
    [Tooltip("Gravity affecting the player while dropping from geometry (without jumping)")]
    public float dropGravity;
   
    

    [Header("Running Movement")]
    public float MaxStableMoveSpeed;
    public float StableMovementSharpness;
    public float OrientationSharpness;
    public AnimationCurve rampUpCurve;
    public AnimationCurve rampDownCurve;
    //public Transform groundedTransform;
    //public float groundedDistance;
    [Header("Jumping Related Stuff")]
    public float hangTimeVelocityThreshold;
    public float JumpSpeed;
    public float desiredJumpHeight;
    public float JumpPreGroundingGraceTime;
    public float JumpPostGroundingGraceTime;
    public float jumpHeight;
    
    [Header("Misc")]
    public bool AllowDoubleJump;
    public bool AllowJumpingWhenSliding;
    public bool useOldHangTime = true;
}
