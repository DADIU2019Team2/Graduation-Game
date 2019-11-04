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
    public float riseGravity;
    public float hangGravity;
    public float fallGravity;
    public AnimationCurve rampUpCurve;
    public AnimationCurve rampDownCurve;
    public float jumpHeight;

    [Header("Running Movement")]
    public float MaxStableMoveSpeed;
    public float StableMovementSharpness;
    public float OrientationSharpness;
    //public Transform groundedTransform;
    //public float groundedDistance;
    [Header("Jumping Related Stuff")]
    public bool _jumpedThisFrame;
    public float hangTimeVelocityThreshold;
    public bool _jumpRequested;
    public float JumpSpeed;
    public float desiredJumpHeight;
    public float JumpPreGroundingGraceTime;
    public float JumpPostGroundingGraceTime;


    [Header("Misc")]
    public bool RotationObstruction;
    public Vector3 Gravity;
    public float floatGravity;
    public float upGravity;
    public float downGravity;
    public Transform MeshRoot;
    public bool AllowDoubleJump;
    public bool AllowJumpingWhenSliding;
    public bool useOldHangTime = true;
}
