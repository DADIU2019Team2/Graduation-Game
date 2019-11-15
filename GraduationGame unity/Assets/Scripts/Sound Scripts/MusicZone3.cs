using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone3 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.PostEvent("StopAll", gameObject);
        
        AkSoundEngine.SetState("Zones", "Zone3");
        
        AkSoundEngine.PostEvent("Play_Zone3_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 1);

        AkSoundEngine.PostEvent("Play_Ambience_Z3", gameObject);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
