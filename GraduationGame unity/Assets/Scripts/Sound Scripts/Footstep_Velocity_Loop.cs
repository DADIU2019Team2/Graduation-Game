using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class Footstep_Velocity_Loop : MonoBehaviour
{
    KinematicCharacterMotor playerMovement;
    // Start is called before the first frame update

    void Start()
    {
        // Plays the footstep loop soundfile on start - only heard when velocity is above 0
        AkSoundEngine.PostEvent("Play_New_Norm_Ftstp_Loop", gameObject);
        playerMovement = FindObjectOfType<KinematicCharacterMotor>();
    }

    // Update is called once per frame
    void Update()
    {
        // When velocity is 0 the footstep loop is not playing - when it is above 0 it plays
        AkSoundEngine.SetRTPCValue("Footstep_velocity", playerMovement.BaseVelocity.magnitude);
    }
}
