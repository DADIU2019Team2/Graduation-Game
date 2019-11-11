using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class Machine1Sound : MonoBehaviour
{
    private bool IsInCollider = false;
    
  // This makes the sound play (loops)
    void Start()
    {
        

        
    }

    void Update()
    {
      
    }

        private void OnTriggerEnter(Collider other)
    {
        // if (other.tag != "Wall?" || IsInCollider) { return; } Ideally i want to use this to make only collision with the wall triggers the sound
        IsInCollider = true;
        AkSoundEngine.PostEvent("Impact_SpikyPlatform", gameObject);
    }
    
}
