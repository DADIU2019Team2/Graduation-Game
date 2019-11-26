using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewAISettings", menuName = "ScriptableObject/Player/AISettings")]
public class AISettings : ScriptableObject
{
    [Header("AI Stuffs")]
    public float searchRange = 5f;
    
    [Header("Stable Movement")]
    public float MaxStableMoveSpeed = 10f;
    public float StableMovementSharpness = 15f;
    public float OrientationSharpness = 10f;

    [Header("Air Movement")]
    public float MaxAirMoveSpeed = 100f;
    public float AirAccelerationSpeed = 15f;
}
