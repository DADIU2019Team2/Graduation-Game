using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SentinelLazerSound : MonoBehaviour
{
    public AK.Wwise.Event sentinelSound;
    
     // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        sentinelSound.Post(gameObject);
        //AkSoundEngine.PostEvent("Sentinel_Lazer", gameObject);
    }

    
}
