using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObject/Player/PlayerSettings")]
public class PlayerControllerSettings : ScriptableObject
{
    
    
    public float hangTimeVelocityCutoff;
    [Header("Gravity Settings")]
    [Tooltip("Base Gravity, don't modify unless you know what you're doing")]
    public float baseGravity;
    [Tooltip("Gravity affecting the player while jumping up")]
    public float riseGravityMultiplier;
    [Tooltip("Gravity affecting the player while hanging mid-jump")]
    public float hangGravityMultiplier;
    [Tooltip("Gravity affecting the player while falling from jumping")]
    public float fallGravityMultiplier;
    [Tooltip("Gravity affecting the player while dropping from geometry (without jumping)")]
    public float dropGravityMultiplier;
   
    

    [Header("Running Movement")]
    public float rampUpTime;
    public float rampDownTime;
    public float maxMoveSpeed;
    public float StableMovementSharpness;
    public float OrientationSharpness;
    public AnimationCurve rampUpCurve;
    public AnimationCurve rampDownCurve;
    
    [Header("Running Movement")]
    public float idleJumpHeight;
    public float idleAirMoveSpeed;
    
    //public Transform groundedTransform;
    //public float groundedDistance;
    [Header("Jumping Related Stuff")]
    public float maxAirMoveSpeed;
    public float hangTimeVelocityThreshold;
    public float JumpPreGroundingGraceTime;
    public float JumpPostGroundingGraceTime;
    public float jumpHeight;
    public bool canChangeMidAir;
    
    [Header("Misc")]
    public bool AllowDoubleJump;
    public bool AllowJumpingWhenSliding;
}
