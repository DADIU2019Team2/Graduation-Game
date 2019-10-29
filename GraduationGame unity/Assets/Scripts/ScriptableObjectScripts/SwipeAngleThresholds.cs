using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "SwipeAngleThresholds", menuName = "ScriptableObject/SwipeAngleThreshholds")]
public class SwipeAngleThresholds : ScriptableObject
{
    [Range(-360, 360)]
    public float swipeUpRightAngles0, swipeUpRightAngles1, 
    swipeBackwardsAngles0, swipeBackwardsAngles1, 
    swipeDownAngles0, swipeDownAngles1;
}
