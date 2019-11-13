﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer8Music : MonoBehaviour {

private bool IsInCollider = false;



    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 9);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 9);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 9);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 9);
    }
}
    