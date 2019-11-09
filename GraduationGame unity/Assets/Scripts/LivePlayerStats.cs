using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LivePlayerStats : MonoBehaviour, IOnSceneReset
{
    public PlayerStats playerStats;
    private bool isDead;
    

    public void TakeDamage(int damage)
    {
        Debug.Log(damage + " damage taken");
        playerStats.subtractHealth(damage);
        if (playerStats.getCurrentHealth() <= 0)
        {
            isDead = true;
            Die();
        }
    }

    public void Die()
    {
        Debug.Log("git gud");
    }
    
    public void OnResetLevel()
    {
        playerStats.resetHealth();
        playerStats.resetStamina();
        isDead = false;
    }
}
