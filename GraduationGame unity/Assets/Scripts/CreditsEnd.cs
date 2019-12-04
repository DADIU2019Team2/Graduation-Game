using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CreditsEnd : MonoBehaviour
{
    public void CreditsDone()
    {
        Debug.Log("ANIM EVENT");
        //GameManager.RequestGameStateChange(GameStateScriptableObject.GameState.levelComplete);
        AkSoundEngine.StopAll();
        int nextScene = SceneManager.GetActiveScene().buildIndex + 1;
        Debug.Log("Amount of scenes vs the index we want to load:" + SceneManager.sceneCountInBuildSettings + " vs " + nextScene);
        if (SceneManager.sceneCountInBuildSettings - 1 < nextScene)
        {
            nextScene = 0;
            //Should have this be the credits scene instead.
        }
        SceneManager.LoadScene(nextScene);
    }
}
