using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class TriggerBroadcastToFungus : MonoBehaviour, IOnSceneReset
{
    public string fungusMessageName;

    private bool wasMessageSent;

    private void Start()
    {

    }

    private void OnTriggerEnter(Collider other)
    {
        if (wasMessageSent) { return; }
        if (GameManager.GetGameState() == GameStateScriptableObject.GameState.mainGameplayLoop && (other.CompareTag("Player") || other.gameObject.layer == LayerMask.NameToLayer("Player")))
        {
            Flowchart.BroadcastFungusMessage(fungusMessageName);
            GameManager.DialogueStart();
            wasMessageSent = true;
        }
    }

    public void OnResetLevel()
    {
        //wasMessageSent = false;
    }
}
