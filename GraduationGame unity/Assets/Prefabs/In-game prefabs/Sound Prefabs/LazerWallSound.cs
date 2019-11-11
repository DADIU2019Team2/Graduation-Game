using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LazerWallSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.PostEvent("Lazer_Wall", gameObject);
    }

 
}
