using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeathSawSound : MonoBehaviour
{
    
    void Start()
    {
        AkSoundEngine.PostEvent("Death_Saw", gameObject);
    }

    
}
