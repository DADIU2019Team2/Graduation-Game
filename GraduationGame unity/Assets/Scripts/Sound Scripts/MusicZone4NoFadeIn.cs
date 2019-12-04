using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone4NoFadeIn : MonoBehaviour
{
    // Start is called before the first frame update
    void Awake() 
    {
        AkSoundEngine.StopAll();
    }
   
    void Start()
    {
        
        AkSoundEngine.SetState("Zones", "Zone4");

        AkSoundEngine.PostEvent("Zones_Music", gameObject);

        AkSoundEngine.PostEvent("Level_Start", gameObject);

        AkSoundEngine.SetRTPCValue("Happy_Bass", 1);
        
        AkSoundEngine.SetRTPCValue("Happy_Synth", 1);

        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 1);

        AkSoundEngine.SetRTPCValue("Music_Layer_Z2", 1);

        AkSoundEngine.SetRTPCValue("Music_Layer_Z3", 1);
        
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 1);

        AkSoundEngine.SetRTPCValue("Angry_Music_Layer", 0);

        AkSoundEngine.PostEvent("Play_Ambience_Z4", gameObject);
    }
}
