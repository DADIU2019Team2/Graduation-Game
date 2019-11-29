using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartCred : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.SetState("Zones", "Credits");
        AkSoundEngine.PostEvent("Credits_Music", gameObject);
    }


}
