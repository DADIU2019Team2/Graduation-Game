using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class TriggerBroadcastToFungus : MonoBehaviour
{
    public string fungusMessageName;

    private void Start()
    {

    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") || other.gameObject.layer == LayerMask.NameToLayer("Player"))
        {
            Flowchart.BroadcastFungusMessage(fungusMessageName);
            
        }
    }
}
