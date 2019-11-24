using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

public class SlowDownTimeCoolZone : MonoBehaviour
{
    [SerializeField] private VoidEvent enteredCoolZone;
    [SerializeField] private VoidEvent exitedCoolZone;

    [Header("CoolZone properties")]
    [SerializeField] private float minTimeScale;
    public float transitionInTime;
    public float transitionOutTime;

    private void OnTriggerEnter(Collider other)
    {
        //start CoolZone
    }

    private void OnTriggerExit(Collider other)
    {
        //Stop CoolZone
    }

    public IEnumerator FloatNumberLerper(float floatToLerp, float desiredOutcome, float lerpTime)
    {
        float initialValue = floatToLerp;
        float stepSize = (desiredOutcome - initialValue) / lerpTime;
        while(floatToLerp != desiredOutcome)
        {

            floatToLerp = Mathf.Lerp(initialValue, desiredOutcome, stepSize * Time.deltaTime);
            yield return new WaitForSeconds(0);
            stepSize += stepSize;
        }
    }
}
