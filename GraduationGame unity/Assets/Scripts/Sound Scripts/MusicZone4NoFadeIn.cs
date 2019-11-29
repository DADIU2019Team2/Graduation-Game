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

        AkSoundEngine.PostEvent("Play_Ambience_Z4", gameObject);
    }
}
