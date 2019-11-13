using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicTest.controller;

public class LivePlayerStats : MonoBehaviour, IOnSceneReset
{
    public PlayerStats playerStats;
    private bool isDead;

    public float currentHealth;
    public float currentStamina;

    [SerializeField] private SaveTransform currentCheckpoint;
    public Vector3 currentSpawnPosition;

    private void Awake()
    {
        currentSpawnPosition = transform.parent.position;
    }
    private void Update()
    {

    }

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

    private void Start()
    {
        playerStats.SetCurrentZoeRecolor(playerStats.selectedSkin); //Ensures that the player sets the selected skin on levelStart 
    }

    public void Die()
    {
        Debug.Log("git gud");
        GameManager.ChangeGameState(GameStateScriptableObject.GameState.levelLoss);
    }

    public void OnResetLevel()
    {
        currentHealth = playerStats.MaxHealth;
        currentStamina = playerStats.MaxStamina;
        playerStats.resetHealth();
        playerStats.resetStamina();
        isDead = false;

        if(CheckpointManager.GetCurerntCheckpoint() != null)
        {
            GetComponentInParent<KinematicTestController>().Motor.SetPosition(currentCheckpoint.GetPosToSave());
        }
        else
        {
            GetComponentInParent<KinematicTestController>().Motor.SetPosition(currentSpawnPosition);
        }
        playerStats.SetCurrentZoeRecolor(playerStats.selectedSkin); //Ensures that the player sets the selected skin on levelStart 
    }

    public void ChangeSkin(int skinIndex)
    {
        playerStats.SetCurrentZoeRecolor(skinIndex);
    }
}
