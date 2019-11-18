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
      
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 8);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 8);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 8);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 8);
    }
}
    