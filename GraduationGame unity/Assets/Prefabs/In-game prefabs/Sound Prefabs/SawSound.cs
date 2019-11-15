using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SawSound : MonoBehaviour
{
   
    void Start()
    {
       //Plays the saw sound, which loops
        AkSoundEngine.PostEvent("Play_Saw", gameObject);
    }

}