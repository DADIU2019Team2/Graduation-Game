using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AlienDoorSoud : MonoBehaviour
{
   
    void Start()
    {
        AkSoundEngine.PostEvent("Alien_Door", gameObject);
    }

}
