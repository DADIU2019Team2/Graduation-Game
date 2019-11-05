using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer7Music : MonoBehaviour {

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
      
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 8);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 8);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 8);
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 8);
    }
}
    