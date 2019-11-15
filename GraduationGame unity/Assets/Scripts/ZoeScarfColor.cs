using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicTest.controller;
using KinematicTest;

public class ZoeScarfColor : MonoBehaviour, IOnSceneReset
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
    private Coroutine lastBlinkRoutine;
    private Coroutine lastIframeDurationRoutine;
    private bool isInvulnerable;
    //[ColorUsage(true,true)]public Color forshow;
    //[ColorUsage(true, true)] public Color forshow2;

    private void Awake()
    {
        isInvulnerable = false;
        //Debug.Log("I started and can take dmg = " + zoeController.GetCanTakeDamage());
        if (ZoeScarfMat != null)
        {
            //ZoeScarfMat.CopyPropertiesFromMaterial(ZoeScarfMatCopy); //make sure that if we overwrote scarfmat we change 
            //it back to what it was last time we pressed play
            //ZoeScarfMat.color = TestColor;
            setColor(baseScarfColor, ZoeScarfMat);
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
    private void setColor(Color color, Material mat)
    {
        mat.SetColor("_colourAttr", color);
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
        //Debug.Log("Update health scarf color!");
        if(lastBlinkRoutine != null)
            StopCoroutine(lastBlinkRoutine);
        if (lastIframeDurationRoutine != null)
            StopCoroutine(lastIframeDurationRoutine);
        float hp = playerStats.playerStats.getCurrentHealth();
        float maxHP = playerStats.playerStats.MaxHealth;
        Color desiredColor = HPBasedScarfColor.Evaluate(hp / maxHP);
        //forshow = desiredColor;
        setColor(desiredColor, ZoeScarfMat);
        lastIframeDurationRoutine = StartCoroutine(UpdateInvulrenableTime(zoeController));
        lastBlinkRoutine = StartCoroutine(BlinkingScarf(zoeController, blinkFrequency, desiredColor));
    }

    IEnumerator BlinkingScarf(KinematicTestController controller, float blinkFrequency, Color initialColor)
    {
        //Debug.Log("I started and can take dmg = " + controller.GetJustTookDamage());
        bool isInitialColor = true;
        //Color initialColor = ZoeScarfMat.color;
        //forshow2 = initialColor;
        float frequencyToSeconds = 1 / blinkFrequency;
        //yield return new WaitForEndOfFrame();
        Debug.Log("Am i invulnerable? = " + isInvulnerable);
        while (isInvulnerable)
        {
            yield return new WaitForSeconds(frequencyToSeconds);
            if (isInitialColor)
            {
                Debug.Log("Invul color");
                //ZoeScarfMat.color = invulnerableColor;
                setColor(invulnerableColor, ZoeScarfMat);
                isInitialColor = !isInitialColor;
            }
            else
            {
                Debug.Log("base color");
                //ZoeScarfMat.color = initialColor;
                setColor(initialColor, ZoeScarfMat);
                isInitialColor = !isInitialColor;
            }
        }
        setColor(initialColor, ZoeScarfMat);
    }
    IEnumerator UpdateInvulrenableTime(KinematicTestController controller)
    {
        isInvulnerable = true;
        float iFrameDuration = controller.GetIFrameMaxDuration();
        Debug.Log("iFrameDuration = " + iFrameDuration);
        
        while(iFrameDuration > 0)
        {
            iFrameDuration -= Time.deltaTime;
            yield return new WaitForSeconds(0f);
        }
        isInvulnerable = false;
    }

    public void OnResetLevel()
    {
        if (lastBlinkRoutine != null)
            StopCoroutine(lastBlinkRoutine);
        if (lastIframeDurationRoutine != null)
            StopCoroutine(lastIframeDurationRoutine);

        setColor(baseScarfColor, ZoeScarfMat);
    }
}
