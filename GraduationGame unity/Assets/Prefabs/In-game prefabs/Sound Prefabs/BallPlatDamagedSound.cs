using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallPlatDamagedSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.PostEvent("Ball_Platform_Damaged", gameObject);
    }


}
