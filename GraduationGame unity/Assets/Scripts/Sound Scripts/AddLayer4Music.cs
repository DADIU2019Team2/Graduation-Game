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
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 2);
        AkSoundEngine.SetRTPCValue("Happy_Bass", 2);
        AkSoundEngine.SetRTPCValue("Happy_Synth", 2);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 4);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 4);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 4);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 4);
    }
}
    