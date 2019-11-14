using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]

public class TriggerHitSave : MonoBehaviour
{
    
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Game Done");
            GameSave.currentSave.UpdateUnlocks(Unlockables.DoubleJump, true);
            GameSave.currentSave.UpdateUnlocks(Unlockables.skin1, true);
            GameSave.GetGameSave().CompletedLevel(0);

        }
    }
}
