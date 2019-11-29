 using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RevertBossMusic : MonoBehaviour 
{

private bool IsInCollider = false;

 
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetState("Zones", "Zone4");
        AkSoundEngine.PostEvent("Play_Zone4_Music", gameObject);
       
    }
}
    