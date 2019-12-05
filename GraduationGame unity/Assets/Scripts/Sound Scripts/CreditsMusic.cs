using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreditsMusic : MonoBehaviour
{
    // Start is called before the first frame update
    public void PlayCreditsMusic()
    {
        AkSoundEngine.StopAll();
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Credits_Music", gameObject);
    }

    public void PlayAmbientSounds()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Ambience_Outside", gameObject);
    }

}
