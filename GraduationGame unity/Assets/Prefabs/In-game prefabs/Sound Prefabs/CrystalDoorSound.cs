using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CrystalDoorSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
       AkSoundEngine.PostEvent("Crystal_Door_Hum", gameObject); 
    }

  
}
