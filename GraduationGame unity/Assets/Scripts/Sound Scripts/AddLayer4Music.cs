using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer4Music : MonoBehaviour {

private bool IsInCollider = false;



   
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("Player") || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 5);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 5);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 5);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 5);
    }
}
    