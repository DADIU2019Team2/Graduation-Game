using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicTest.controller;
using MiniGame2.Events;
using UnityEngine.Events;

public class LivePlayerStats : MonoBehaviour, IOnSceneReset
{
    public PlayerStats playerStats;
    private bool isDead;
    public ParticleSystem deathParticles;


    //public float currentHealth;
    //public float currentStamina;

    public Vector3 currentSpawnPosition;

    public delegate void OnZoeTakeDamageDelegate();
    public event OnZoeTakeDamageDelegate zoeTakeDamageEvent;
    public VoidEvent DeathVoidEvent;
    private void Awake()
    {
        currentSpawnPosition = transform.parent.position;
        playerStats.resetHealth();

    }
    private void Update()
    {

    }

    public void TakeDamage(int damage)
    {
        Debug.Log(damage + " damage taken");
        playerStats.subtractHealth(damage);
        if(zoeTakeDamageEvent != null)
            zoeTakeDamageEvent();
        if (playerStats.getCurrentHealth() <= 0)
        {

            //Play Death Particle
            deathParticles.Play();
            isDead = true;
            AkSoundEngine.SetState("Dead_or_Alive", "Dead");
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
        //despawn meshes
        DeathVoidEvent.Raise();
        //GameManager.ChangeGameState(GameStateScriptableObject.GameState.levelLoss);
        GameManager.RequestGameStateChange(GameStateScriptableObject.GameState.levelLoss);
    }

    public void OnResetLevel()
    {
        //currentHealth = playerStats.MaxHealth;
        //currentStamina = playerStats.MaxStamina;
        AkSoundEngine.SetState("Dead_or_Alive", "Alive");
        deathParticles.Stop();
        deathParticles.Clear();
        playerStats.resetHealth();
        playerStats.resetStamina();
        isDead = false;

        if(CheckpointManager.GetCurerntCheckpoint() != Vector3.zero)
        {
            Debug.Log(CheckpointManager.GetCurerntCheckpoint());
            GetComponentInParent<KinematicTestController>().Motor.SetPosition(CheckpointManager.GetCurerntCheckpoint());
        }
        else
        {
            GetComponentInParent<KinematicTestController>().Motor.SetPosition(currentSpawnPosition);
        }
        playerStats.SetCurrentZoeRecolor(playerStats.selectedSkin); //Ensures that the player sets the selected skin on levelStart 
    }

    public void OnCheckPointReached()
    {
        playerStats.resetHealth();
        playerStats.resetStamina();
    }
    
    public void ChangeSkin(int skinIndex)
    {
        playerStats.SetCurrentZoeRecolor(skinIndex);
    }
}
