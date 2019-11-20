using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone3 : MonoBehaviour
{
    // Start is called before the first frame update
      void Awake() 
    {
        AkSoundEngine.StopAll();
    }
    
    void Start()
    {
        
        AkSoundEngine.SetState("Zones", "Zone3");

        AkSoundEngine.PostEvent("Level_Start", gameObject);
        
        AkSoundEngine.PostEvent("Play_Zone3_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Happy_Drumz", 2, gameObject, 5000);

        AkSoundEngine.PostEvent("Play_Ambience_Z3", gameObject);
    }
}
