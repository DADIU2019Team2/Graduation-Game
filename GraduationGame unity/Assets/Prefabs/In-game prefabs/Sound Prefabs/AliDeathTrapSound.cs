using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeathTrapSound : MonoBehaviour
{
    
    void Start()
    {
        AkSoundEngine.PostEvent("Alien_Death_Trap", gameObject);
    }


}
