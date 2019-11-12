using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(BoxCollider))]
public class Checkpoint : MonoBehaviour
{
    [SerializeField] private Transform spawnPoint;

    private BoxCollider trigger;

    private void Awake()
    {
        trigger = GetComponent<BoxCollider>();
        trigger.isTrigger = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.layer == LayerMask.NameToLayer("Player"))
        {
            SendMessageUpwards("SetCurrentCheckpoint", spawnPoint, SendMessageOptions.RequireReceiver);
        }
            
    }
}
