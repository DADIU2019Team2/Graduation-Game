using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

//public enum CoolZoneTimeScaleResetType { ResetToOne, ResetToInitial}

[System.Flags]
public enum CoolZoneSettings
{
    UsesTimeScale,
    ResetsToInitialTimeScale,
    //ResetsTimeScaleToOne,
    UsesParticles,
    UsesCameraZoom
}

public class CoolZone : MonoBehaviour
{
    [SerializeField] private VoidEvent enteredCoolZone;
    [SerializeField] private VoidEvent exitedCoolZone;

    [Header("CoolZone properties")]
    //public CoolZoneTimeScaleResetType timeScaleResetType;
    [SerializeField] private float desiredTimeScale;
    public float timeToFullCoolness;
    public float timeBackToNormalness;
    public ParticleSystem particleSystemToPlay;

    [EnumFlags]
    public CoolZoneSettings settings;

    private float initialTimeScale;

    private void OnTriggerEnter(Collider other)
    {
        //start CoolZone
    }

    private void StartCoolZone(bool ShouldEffectCamera)
    {
        initialTimeScale = Time.timeScale;
        float tempTimeScale = initialTimeScale;

        if (settings.HasFlag(CoolZoneSettings.UsesParticles))
        {
            //instantiate particles
        }

        if (settings.HasFlag(CoolZoneSettings.UsesTimeScale)) //Time Scale
        {
            FloatNumberLerper(tempTimeScale, desiredTimeScale, timeToFullCoolness); 
        }
        
        if (enteredCoolZone != null)
            if(settings.HasFlag(CoolZoneSettings.UsesCameraZoom)) // Use Camera
                enteredCoolZone.Raise();


        //sets temp timescale to desired timescale over timetofullcoolness
    }

    private void OnTriggerExit(Collider other)
    {
        //Stop CoolZone
    }

    private void stopCoolZone()
    {
        float returnTimeScale = 0;
        float tempTimeScale = Time.timeScale;

        //switch (timeScaleResetType)
        //{
        //    case CoolZoneTimeScaleResetType.ResetToOne:
        //        returnTimeScale = 1;
        //        break;
        //    case CoolZoneTimeScaleResetType.ResetToInitial:
        //        returnTimeScale = initialTimeScale;
        //        break;
        //    default:
        //        Debug.LogError("TimescaleResetType entered default state, this shouldn't happen! Click to review code");
        //        break;
        //}


    }

    public IEnumerator FloatNumberLerper(float floatToLerp, float desiredOutcome, float lerpTime)
    {
        float initialValue = floatToLerp;
        float stepSize = (desiredOutcome - initialValue) / lerpTime;
        while (floatToLerp != desiredOutcome)
        {

            floatToLerp = Mathf.Lerp(initialValue, desiredOutcome, stepSize * Time.deltaTime);
            yield return new WaitForSeconds(0);
            stepSize += stepSize;
        }
    }

    List<int> ReturnSelectedCoolZoneSettingsElements()
    {

        List<int> selectedElements = new List<int>();
        for (int i = 0; i < System.Enum.GetValues(typeof(CoolZoneSettings)).Length; i++)
        {
            int layer = 1 << i;
            if (((int)settings & layer) != 0)
            {
                selectedElements.Add(i);
            }
        }
        return selectedElements;
    }
}