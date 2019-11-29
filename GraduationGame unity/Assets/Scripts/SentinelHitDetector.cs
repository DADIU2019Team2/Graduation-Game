using System;
using System.Collections;
using System.Collections.Generic;
using MiniGame2.Events;
using UnityEngine;

public class SentinelHitDetector : MonoBehaviour
{
    public VoidEvent sentinelDeathEvent;
    
    private void OnCollisionEnter(Collision other)
    {
        if (other.collider.CompareTag("Sentinel"))
        {
            Debug.Log("alma");
            sentinelDeathEvent.Raise();
        }
    }

}
