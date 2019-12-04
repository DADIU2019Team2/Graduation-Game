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

        AkSoundEngine.SetRTPCValue("Happy_Drumz", 5);

        AkSoundEngine.SetRTPCValue("Happy_Bass", 1);
        
        AkSoundEngine.SetRTPCValue("Happy_Synth", 1);

        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 1);

        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 1);

        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 1);
        
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 1);

        AkSoundEngine.SetRTPCValue("Angry_Music_Layer", 0);

        AkSoundEngine.PostEvent("Play_Ambience_Z1", gameObject);
    
    }

  
}
