using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RemoveIntensityAdd2Layers : MonoBehaviour
{

private bool IsInCollider = false;
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }

void OnTriggerEnter (Collider other)
{
    if (other.tag != "Player" || IsInCollider) { return; }
    AkSoundEngine.SetRTPCValue("Angry_Music_Layer", 0);
    AkSoundEngine.SetRTPCValue("Happy_Drumz", 5);
    AkSoundEngine.SetRTPCValue("Happy_Bass", 5);
    AkSoundEngine.SetRTPCValue("Happy_Synth", 0);
    
}

}
