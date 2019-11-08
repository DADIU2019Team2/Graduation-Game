using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ElectricitySound : MonoBehaviour
{
 
    void Start()
    {
        //Plays the electricity sound, which loops
        AkSoundEngine.PostEvent("Play_Electricity", gameObject);
    }


}
