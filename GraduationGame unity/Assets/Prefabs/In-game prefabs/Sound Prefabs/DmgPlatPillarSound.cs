using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DmgPlatPillar : MonoBehaviour
{
    // starts looping sound for the Damaged Pillar Platform
    void Start()
    {
        AkSoundEngine.PostEvent("Platform_Pillar_Damaged", gameObject);
    }


}
