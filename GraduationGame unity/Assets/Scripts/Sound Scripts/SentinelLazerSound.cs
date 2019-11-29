using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SentinelLazerSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Sentinel_Lazer", gameObject);
    }

    
}
