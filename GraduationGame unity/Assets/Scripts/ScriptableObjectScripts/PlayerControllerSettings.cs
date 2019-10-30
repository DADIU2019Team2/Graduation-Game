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
    public Transform groundedTransform;
    public float groundedDistance;
}
