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

        AkSoundEngine.PostEvent("Level_Start", gameObject);
        
        AkSoundEngine.PostEvent("Play_Zone4_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 2);

        AkSoundEngine.PostEvent("Play_Ambience_Z4", gameObject);
    }
}
