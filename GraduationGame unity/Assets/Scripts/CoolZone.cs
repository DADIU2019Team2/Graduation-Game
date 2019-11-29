using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

//public enum CoolZoneTimeScaleResetType { ResetToOne, ResetToInitial}

[System.Flags]
public enum CoolZoneSettings
{
    //None = 0,
    UsesTimeScale = 1,
    ResetsToInitialTimeScale = 2,
    //ResetsTimeScaleToOne,
    UsesParticles = 4,
    UsesCameraZoom = 8
}

public class CoolZone : MonoBehaviour
{
    [Header("Related events")]
    [SerializeField] private VoidEvent enteredCoolZone;
    [SerializeField] private VoidEvent exitedCoolZone;

    [Header("CoolZone properties")]
    [SerializeField] private float desiredTimeScale;
    public float timeToFullCoolness;
    public float timeBackToNormalness;
    public ParticleSystem particleSystemToPlay;

    [EnumFlags]
    public CoolZoneSettings settings;

    [Header("Trigger on for objects with tag")]
    public string tagToLookFor = "Player";

    private float initialTimeScale;
    private Coroutine lastRoutine;

    /*private void Start()
    {
        Debug.Log("Settings = "+ settings.ToString());
        //people say online that this method is more effecient than HasFlag but i think HasFlag is easier to work with, and it's not like it's hugely ineffecient
        //if((settings & CoolZoneSettings.UsesTimeScale | CoolZoneSettings.ResetsToInitialTimeScale) == (CoolZoneSettings.UsesTimeScale | CoolZoneSettings.ResetsToInitialTimeScale))
        //{
        //    Debug.Log("Settings is true!!!!");
        //}
        Debug.Log("settings is = " + settings.HasFlag(CoolZoneSettings.UsesTimeScale | CoolZoneSettings.UsesCameraZoom));
    }*/

    private void OnTriggerEnter(Collider other)
    {
        //start CoolZone
        if (other.CompareTag(tagToLookFor))
        {
            StartCoolZone();
            Debug.Log("Started CoolZone!");
        }
    }

    private void StartCoolZone()
    {
        initialTimeScale = Time.timeScale;
        float tempTimeScale = initialTimeScale;

        if (settings.HasFlag(CoolZoneSettings.UsesParticles))
        {
            //instantiate particles
            throw new System.NotImplementedException();
        }

        if (settings.HasFlag(CoolZoneSettings.UsesTimeScale)) //Time Scale
        {
            //sets timescale to desired timescale over timetofullcoolness
            StopTimeScaleLerp();
            Debug.Log("temp timescale = " + tempTimeScale + "   Desired timescale = " + desiredTimeScale + "   duration = " + timeToFullCoolness);
            StartCoroutine(TimeScaleLerper(tempTimeScale, desiredTimeScale, timeToFullCoolness));
            Debug.Log("Time should  slow down now...");
        }
        
        if (enteredCoolZone != null)
            if(settings.HasFlag(CoolZoneSettings.UsesCameraZoom)) // Use Camera
                enteredCoolZone.Raise();
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag(tagToLookFor))
        {
            stopCoolZone();
            Debug.Log("Stopped CoolZone!");
        }
    }

    private void stopCoolZone()
    {
        float tempTimeScale = Time.timeScale;

        if (settings.HasFlag(CoolZoneSettings.ResetsToInitialTimeScale | CoolZoneSettings.UsesTimeScale))
        {
            //sets timescale to initial timescale over timeBackToNormalness
            StopTimeScaleLerp();
            StartCoroutine(TimeScaleLerper(tempTimeScale, initialTimeScale, timeBackToNormalness));
        }
        else if(!settings.HasFlag(CoolZoneSettings.ResetsToInitialTimeScale | CoolZoneSettings.UsesTimeScale))
        {
            StopTimeScaleLerp();
            StartCoroutine(TimeScaleLerper(tempTimeScale, 1f, timeBackToNormalness));
        }

        if (settings.HasFlag(CoolZoneSettings.UsesParticles))
        {
            throw new System.NotImplementedException();
        }

        if (exitedCoolZone != null)
        {
            if (settings.HasFlag(CoolZoneSettings.UsesCameraZoom))
            {
                exitedCoolZone.Raise();
            }
        }
    }

    void StopTimeScaleLerp()
    {
        if (lastRoutine != null)
            StopCoroutine(lastRoutine);
        Time.timeScale = 1;
    }

    public IEnumerator TimeScaleLerper(float floatToLerp, float desiredOutcome, float lerpTime)
    {
        float initialValue = floatToLerp;
        float stepSize = (Mathf.Abs((desiredOutcome - initialValue)) / lerpTime); //* Time.fixedDeltaTime;
        float dirToStep = desiredOutcome - initialValue;
        float stairs = initialValue;
        Debug.Log("Initial stepsize: " + stepSize);
        while (floatToLerp != desiredOutcome)
        {
            floatToLerp = Mathf.Lerp(initialValue, desiredOutcome, stairs);
            Time.timeScale = floatToLerp;
            //Debug.Log("Float to lerp = " + floatToLerp);

            yield return new WaitForSecondsRealtime(0);

            if(dirToStep > 0)
                stairs += stepSize * Time.fixedDeltaTime;
            else
            {
                stairs -= stepSize * Time.fixedDeltaTime;
            }
            //Debug.Log("Step size: " + stepSize);
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