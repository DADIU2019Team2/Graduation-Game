using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer8Music : MonoBehaviour {

private bool IsInCollider = false;



    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
       
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 9);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 9);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 9);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 9);
    }
}
    