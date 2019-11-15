using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicTest.controller;
using KinematicTest;

public class ZoeScarfColor : MonoBehaviour
{
    [SerializeField] [ColorUsageAttribute(true, true)] private Color baseScarfColor;
    [Tooltip("Left side is color on 0 HP, Right side is Color on Max HP")]
    [SerializeField] [GradientUsageAttribute(true)] private Gradient HPBasedScarfColor;
    [SerializeField] [ColorUsageAttribute(true, true)] private Color invulnerableColor;
    [SerializeField] float blinkFrequency = 0.5f;
    [SerializeField] private KinematicTestController zoeController;

    //use some listener for changing the color whenever Zoe takes dmg

    [SerializeField] private Material ZoeScarfMat;
    //[SerializeField] private Material ZoeScarfMatCopy;

    [SerializeField] private LivePlayerStats playerStats;
    //public Color testColor;
    //[ColorUsageAttribute(true, true)] public Color BaseTestColor
    private Coroutine lastRoutine;
    private void Awake()
    {
        if(ZoeScarfMat != null)
        {
            //ZoeScarfMat.CopyPropertiesFromMaterial(ZoeScarfMatCopy); //make sure that if we overwrote scarfmat we change 
            //it back to what it was last time we pressed play
            ZoeScarfMat.color = baseScarfColor;
            //ZoeScarfMatCopy.CopyPropertiesFromMaterial(ZoeScarfMat);
            //testColor = ZoeScarfMat.color;
            //BaseTestColor = testColor;

        }
        else
        {
            Debug.LogError("No ZoeScarfMat was assigned on " + gameObject.name + " in ZoeScarfColor");
        }
        if(zoeController == null)
        {
            Debug.LogError("No Zoe Controller was assigned in " + gameObject.name + " in ZoeScarfColor");
            zoeController = new KinematicTestController();
        }
    }
    private void Start()
    {
        playerStats.zoeTakeDamageEvent += UpdateHealthBasedScarfColor;
    }

    private void OnDisable()
    {
        //ZoeScarfMat.CopyPropertiesFromMaterial(ZoeScarfMatCopy);
        playerStats.zoeTakeDamageEvent -= UpdateHealthBasedScarfColor;
    }
    private void OnApplicationQuit()
    {
        //ZoeScarfMat.CopyPropertiesFromMaterial(ZoeScarfMatCopy);
    }

    private void UpdateHealthBasedScarfColor()
    {
        if(lastRoutine != null)
            StopCoroutine(lastRoutine);
        float hp = playerStats.playerStats.getCurrentHealth();
        float maxHP = playerStats.playerStats.MaxHealth;
        ZoeScarfMat.color = HPBasedScarfColor.Evaluate(hp / maxHP);
        lastRoutine = StartCoroutine(BlinkingScarf(zoeController, blinkFrequency));
    }

    IEnumerator BlinkingScarf(KinematicTestController controller, float blinkFrequency)
    {
        bool isInitialColor = true;
        Color initialColor = ZoeScarfMat.color;
        float frequencyToSeconds = 1 / blinkFrequency;
        while (!controller.GetCanTakeDamage())
        {
            yield return new WaitForSeconds(frequencyToSeconds);
            if (isInitialColor)
            {
                ZoeScarfMat.color = invulnerableColor;
                isInitialColor = !isInitialColor;
            }
            else
            {
                ZoeScarfMat.color = initialColor;
                isInitialColor = !isInitialColor;
            }
        }       
    }
}
