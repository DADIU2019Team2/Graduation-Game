﻿ using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetBossMusic : MonoBehaviour 
{

private bool IsInCollider = false;

 
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetState("Zones", "BossFight");
        AkSoundEngine.PostEvent("BossMusic", gameObject);
       
    }
}
    