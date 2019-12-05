using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreditsMusic : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Credits_Music", gameObject);
    }


}
