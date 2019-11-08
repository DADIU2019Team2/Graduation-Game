using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class Machine3Sound : MonoBehaviour
{
    private bool IsInCollider = false;
    
  // This makes the sound play (loops)
    void Start()
    {
        
        AkSoundEngine.PostEvent("Machine_3", gameObject);
        
    }

    void Update()
    {
        // This makes the soundly audible only when the RTPC value is above 0 - which is tied to movement of the platform
        PhysicsMover physicsMover = gameObject.GetComponentInChildren(typeof(PhysicsMover)) as PhysicsMover;
        AkSoundEngine.SetRTPCValue("Machine_Movement_3", physicsMover.GetState().Velocity.magnitude);
    }

        private void OnTriggerEnter(Collider other)
    {
        // if (other.tag != "Wall?" || IsInCollider) { return; } Ideally i want to use this to make only collision with the wall triggers the sound
        IsInCollider = true;
        AkSoundEngine.PostEvent("Impact_SpikyPlatform", gameObject);
    }
    
}
