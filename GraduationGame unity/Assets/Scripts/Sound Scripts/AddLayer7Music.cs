using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer7Music : MonoBehaviour {

private bool IsInCollider = false;


    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 5);
        AkSoundEngine.SetRTPCValue("Happy_Bass", 5);
        AkSoundEngine.SetRTPCValue("Happy_Synth", 5);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 7);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 7);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 7);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 7);
    }
}
    