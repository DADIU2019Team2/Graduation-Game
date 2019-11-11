using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallPlatformSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.PostEvent("Ball_Platform", gameObject);
    }


}
