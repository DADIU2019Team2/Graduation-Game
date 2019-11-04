using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class Footstep_Velocity_Loop : MonoBehaviour
{
    // Start is called before the first frame update
    private KinematicCharacterMotor charMovement;
    void Start()
    {
       // Plays the footstep loop soundfile on start - only heard when velocity is above 0
       AkSoundEngine.PostEvent("Play_Footstep_loop_PH", gameObject);
        charMovement = FindObjectOfType<KinematicCharacterMotor>();
    }

    // Update is called once per frame
    void Update()
    {
        // When velocity is 0 the footstep loop is not playing - when it is above 0 it plays
        AkSoundEngine.SetRTPCValue("Footstep_velocity", charMovement.Velocity.magnitude);
    }
}
