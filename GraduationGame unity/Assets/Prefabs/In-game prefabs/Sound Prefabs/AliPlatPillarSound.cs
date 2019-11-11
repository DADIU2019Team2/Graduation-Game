using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{
    
    void Start()
    {
        AkSoundEngine.PostEvent("Alien_Platform_Pillar", gameObject);
    }

  
}
