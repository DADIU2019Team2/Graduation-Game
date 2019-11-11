using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeathRaySound : MonoBehaviour
{
    
    void Start()
    {
        AkSoundEngine.PostEvent("Death_Ray", gameObject);
    }

}
