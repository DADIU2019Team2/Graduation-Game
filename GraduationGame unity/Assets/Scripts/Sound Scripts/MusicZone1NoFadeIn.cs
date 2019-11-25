using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone1NoFadeIn : MonoBehaviour
{
 
    void Awake()
    {
        AkSoundEngine.StopAll();
    }
    void Start()
    {
        
        
        AkSoundEngine.SetState("Zones", "Zone1");
        
        AkSoundEngine.PostEvent("Play_Zone1_Music", gameObject);

        AkSoundEngine.PostEvent("Level_Start", gameObject);
        
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 2);

        AkSoundEngine.PostEvent("Play_Ambience_Z1", gameObject);
    
    }

  
}
