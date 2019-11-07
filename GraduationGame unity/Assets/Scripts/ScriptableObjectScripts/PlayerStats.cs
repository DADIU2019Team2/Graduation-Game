using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

[CreateAssetMenu(fileName ="New playerStats", menuName ="ScriptableObject/Player/Player stats")]
public class PlayerStats : ScriptableObject
{
    public Material[] defaultZoeMaterials;
    private Material[] currentZoeMaterials;

    public float MaxHealth;
    private float currentHealth;

    public float MaxStamina;
    private float currentStamina;

    public void addHealth(float value)
    {
        currentHealth += value;
        Mathf.Clamp(currentHealth, 0, MaxHealth);
    }
    public void subtractHealth(float value)
    {
        currentHealth -= value;
        if (currentHealth <= 0)
            GameManager.gameState = GameStateScriptableObject.GameState.levelLoss;
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


    public Material[] getCurrentZoeColorScheme()
    {
        return currentZoeMaterials;
    }
    public void setZoeColorScheme(Material[] colorScheme)
    {
        currentZoeMaterials = colorScheme;
    }
}
