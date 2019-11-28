using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StopSounds : MonoBehaviour
{
    public void StopAllAkSounds()
    {
        AkSoundEngine.StopAll();
    }
}
