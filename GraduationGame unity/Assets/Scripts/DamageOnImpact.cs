using System;
using System.Collections;
using System.Collections.Generic;
using MiniGame2.Events;
using UnityEngine;

public class DamageOnImpact : MonoBehaviour
{
    public int damage;
    public IntEvent damagePlayer;
    private void OnCollisionEnter(Collision other)
    {
        Debug.Log("player hit");
        if (other.collider.CompareTag("Player"))
        {
            damagePlayer.Raise(damage);
        }
    }
    
}
