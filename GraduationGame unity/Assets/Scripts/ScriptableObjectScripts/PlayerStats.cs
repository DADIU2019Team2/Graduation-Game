using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

[CreateAssetMenu(fileName ="New playerStats", menuName ="ScriptableObject/Player/Player stats")]
public class PlayerStats : ScriptableObject
{
    public float MaxHealth;
    private float currentHealth;

    public void addHealth(float value)
    {
        currentHealth += value;
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
}
