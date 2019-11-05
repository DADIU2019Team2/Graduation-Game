using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone3 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.SetState("Zones", "Zone3");
        
        AkSoundEngine.PostEvent("Play_Zone3_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 1);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
