using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer6Music : MonoBehaviour {

private bool IsInCollider = false;



    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 6);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 6);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 6);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 6);
    }
}
    