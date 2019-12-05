using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CreditsEnd : MonoBehaviour
{
    public void CreditsDone()
    {
        
        AkSoundEngine.StopAll();
        LoadScene.LoadSceneMainAsync();
        
    }
}
