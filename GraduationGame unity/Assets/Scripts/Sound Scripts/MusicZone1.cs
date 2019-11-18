using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone1 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.PostEvent("StopAll", gameObject);
        
        AkSoundEngine.SetState("Zones", "Zone1");
        
        AkSoundEngine.PostEvent("Play_Zone1_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 1);

        AkSoundEngine.PostEvent("Play_Ambience_Z1", gameObject);
    
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
