using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

[CreateAssetMenu(fileName = "New playerStats", menuName = "ScriptableObject/Player/Player stats")]
public class PlayerStats : ScriptableObject
{
    //public Material[] defaultZoeMaterials;
    //private Material[] currentZoeMaterials;

    
    public int selectedSkin;
    [SerializeField]
    private IntEvent changeZoeRecolor;
    public ZoeRecolor[] allZoeRecolors;
    private ZoeRecolor currentZoeRecolor;


    public float MaxHealth;
    private float currentHealth;

    public float MaxStamina;
    private float currentStamina;

    public ZoeRecolor defaultZoeRecolor; //The one to select if no other skin has been selected.

    public void SetCurrentZoeRecolor(int zoeRecolorIndex)
    {
        //Call "ChangeZoeRecolor" event that is listened for by skinswapper.cs on the zoe-CGI nested prefab. (Only if there is a recolor with the corresponding index though)
        if (allZoeRecolors[zoeRecolorIndex] != null)
        {
            currentZoeRecolor = allZoeRecolors[zoeRecolorIndex];
            changeZoeRecolor.Raise(zoeRecolorIndex);    
        }
    }

    public ZoeRecolor GetCurrentRecolor()
    {
        return currentZoeRecolor;
    }

    public void addHealth(float value)
    {
        currentHealth += value;
        Mathf.Clamp(currentHealth, 0, MaxHealth);
    }
    public void subtractHealth(float value)
    {
        currentHealth -= value;
    }
    public void resetHealth()
    {
        currentHealth = MaxHealth;
    }
    public float getCurrentHealth()
    {
        return currentHealth;
    }


    public void addStamina(float value)
    {
        currentStamina += value;
        Mathf.Clamp(currentStamina, 0, MaxStamina);
    }
    public void subtractStamina(float value)
    {
        currentStamina -= value;
        Mathf.Clamp(currentStamina, 0, MaxStamina);
    }
    public void resetStamina()
    {
        currentStamina = MaxStamina;
    }
    public float getCurrentstamina()
    {
        return currentStamina;
    }

    /*
    public Material[] getCurrentZoeColorScheme()
    {
        return currentZoeMaterials;
    }
    public void setZoeColorScheme(Material[] colorScheme)
    {
        currentZoeMaterials = colorScheme;
    }
    */
}
