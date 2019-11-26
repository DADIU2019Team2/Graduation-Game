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
    public bool hasDied;

    private enum PlayerRespawnDirection
    {
        Right, Left
    }
    [SerializeField]
    private PlayerRespawnDirection respawnRunDirection;


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
        AkSoundEngine.PostEvent("Ouch", gameObject);
        if (zoeTakeDamageEvent != null)
            zoeTakeDamageEvent();
        if (playerStats.getCurrentHealth() <= 0)
        {
            if (!isDead)
            {
                Die();
            }
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
        deathParticles.Play();
        isDead = true;
        AkSoundEngine.SetState("Dead_or_Alive", "Dead");
        DeathVoidEvent.Raise();
        isDead = true;
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

        KinematicTestController.runningRight = respawnRunDirection == PlayerRespawnDirection.Right ? 1 : -1; //-1 is running left, 1 is running right.

        if (CheckpointManager.GetCurerntCheckpoint() != Vector3.zero)
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

    public void SetRespawnDirectionToLeft()
    {
        respawnRunDirection = PlayerRespawnDirection.Left;
    }

    public void SetRespawnDirectionToRight()
    {
        respawnRunDirection = PlayerRespawnDirection.Right;
    }
}