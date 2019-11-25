using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossZoneMusic : MonoBehaviour
{
    // Start is called before the first frame update
    void Awake()
    {

        AkSoundEngine.StopAll();
    }
    void Start()
    {
        
        
        AkSoundEngine.SetState("Zones", "BossFight");
        
        AkSoundEngine.PostEvent("BossMusic_Music", gameObject);

        AkSoundEngine.PostEvent("Level_Start", gameObject);

        AkSoundEngine.PostEvent("Play_Ambience_Z3", gameObject);
    
    }

  
}
