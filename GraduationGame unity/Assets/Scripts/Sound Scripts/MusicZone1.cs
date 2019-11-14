using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicZone1 : MonoBehaviour
{
    // Start is called before the first frame update
    void Awake()
    {
        AkSoundEngine.StopAll();
    }
    void Start()
    {
        
        
        AkSoundEngine.SetState("Zones", "Zone1");
        
        AkSoundEngine.PostEvent("Play_Zone1_Music", gameObject);
        
        AkSoundEngine.SetRTPCValue("Music_Layer_Z1", 1);

        AkSoundEngine.PostEvent("Play_Ambience_Z1", gameObject);
    
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
