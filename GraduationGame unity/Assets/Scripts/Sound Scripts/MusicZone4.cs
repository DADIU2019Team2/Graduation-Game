using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone4 : MonoBehaviour
{
    // Start is called before the first frame update
     void Awake() 
    {
        AkSoundEngine.PostEvent("StopAll", gameObject);
    }
   
    void Start()
    {
        
        AkSoundEngine.SetState("Zones", "Zone4");
        
        AkSoundEngine.PostEvent("Play_Zone4_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Music_Layer_Z4", 1);

        AkSoundEngine.PostEvent("Play_Ambience_Z4", gameObject);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
