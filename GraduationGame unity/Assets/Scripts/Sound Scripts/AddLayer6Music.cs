using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddLayer6Music : MonoBehaviour {

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
        AkSoundEngine.PostEvent("Set_Z1_Music_6", gameObject);
        AkSoundEngine.PostEvent("Set_Z2_Music_6", gameObject);
        AkSoundEngine.PostEvent("Set_Z3_Music_6", gameObject);
        AkSoundEngine.PostEvent("Set_Z4_Music_6", gameObject);
    }
}
    