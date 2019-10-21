using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Gravity Global Values", menuName = "ScriptableObject/Gravity Globals")]
public class GravityGlobalValues : ScriptableObject
{
    [SerializeField]
    private float gravityModifierValue;
    [SerializeField]
    private float angleThresholdValue;

    public void setGravityModifier(float value)
    {
        gravityModifierValue = value;
    }
    public float getgravityModifier()
    {
        return gravityModifierValue;
    }

    public void setAngleThreshold(float value)
    {
        angleThresholdValue = value;
    }
    public float getAngleThreshold()
    {
        return angleThresholdValue;
    }
}
