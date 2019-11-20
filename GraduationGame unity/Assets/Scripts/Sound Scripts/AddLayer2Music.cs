using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer2Music : MonoBehaviour {

private bool IsInCollider = false;


    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Happy_Bass", 3);
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 2);
    }
}
    