using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeathTrapSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Alien_Death_Trap", gameObject);
    }

 
}
