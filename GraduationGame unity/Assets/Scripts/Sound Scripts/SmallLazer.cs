using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SmallLazer : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Lazer_Small", gameObject);
    }


}
