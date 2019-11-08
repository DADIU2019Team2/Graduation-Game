using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class PlatformSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
        AkSoundEngine.PostEvent("MovingPlatform_Sound", gameObject);
    }

    // Update is called once per frame
    void Update()
    {
        PhysicsMover physicsMover = gameObject.GetComponentInChild(typeof(PhysicsMover)) as PhysicsMover;
        AkSoundEngine.SetRTPCValue("Platform_Movement", physicsMover.GetState().Velocity);
    }
}
