using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class AliPlat5Sound : MonoBehaviour
{
    // This makes the sound play (loops)
    void Start()
    {
        
        AkSoundEngine.PostEvent("Alien_Platform_5", gameObject);
        
    }

    
    void Update()
    {
        // This makes the soundly audible only when the RTPC value is above 0 - which is tied to movement of the platform
        PhysicsMover physicsMover = gameObject.GetComponentInChildren(typeof(PhysicsMover)) as PhysicsMover;
        AkSoundEngine.SetRTPCValue("Platform_Movement_5", physicsMover.GetState().Velocity.magnitude);
    }
}
