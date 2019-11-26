using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]


public class TriggerHitSave : MonoBehaviour
{
    public bool shouldUnlockSomething = false;
    public Unlockables[] itemToUnlock;    
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            //Debug.Log("Game Done");
            if (shouldUnlockSomething)
            {
                foreach (Unlockables item in itemToUnlock)
                {
                    UnlockItem.UnlockItems(item);
                }
            
            }
            GameSave.GetGameSave().CompletedLevel();
            //GameManager.ChangeGameState(GameStateScriptableObject.GameState.levelComplete);
            GameManager.RequestGameStateChange(GameStateScriptableObject.GameState.levelComplete);

        }
    }
}
