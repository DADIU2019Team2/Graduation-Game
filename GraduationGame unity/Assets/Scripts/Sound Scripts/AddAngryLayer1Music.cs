using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddAngryLayer1Music : MonoBehaviour
{

private bool IsInCollider = false;

    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    
private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Angry_Music_Layer", 3);
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 1);
        AkSoundEngine.SetRTPCValue("Happy_Bass", 1);
        AkSoundEngine.SetRTPCValue("Happy_Synth", 1);
        
    }

}
