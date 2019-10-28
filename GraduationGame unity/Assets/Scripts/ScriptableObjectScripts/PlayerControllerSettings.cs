using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObject/Player/PlayerSettings")]
public class PlayerControllerSettings : ScriptableObject
{
    public float rampUpTime;
    public float rampDownTime;
    public float maxSpeed;
    public float gravity;
    public AnimationCurve rampUpCurve;
    public AnimationCurve rampDownCurve;
}
