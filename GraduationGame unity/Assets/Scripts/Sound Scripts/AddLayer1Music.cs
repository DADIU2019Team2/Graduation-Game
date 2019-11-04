using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer1Music : MonoBehaviour {

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
        IsInCollider = true;
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 2);
        AkSoundEngine.PostEvent("Music_Layer_Z2", 2);
        AkSoundEngine.PostEvent("Music_Layer_Z3", 2);
        AkSoundEngine.PostEvent("Music_Layer_Z4", 2);
    }
}
    