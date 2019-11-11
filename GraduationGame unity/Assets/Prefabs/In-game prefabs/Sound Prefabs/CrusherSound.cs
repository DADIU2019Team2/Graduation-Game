using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CrusherSound : MonoBehaviour
{
    // plays the looping sound for the crusher
    void Start()
    {
        AkSoundEngine.PostEvent("Crusher_Idle", gameObject);
    }

}
