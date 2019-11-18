using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadScene : MonoBehaviour
{
    public void loadNextScene()
    {
        if(getCurrentScene() + 1 < SceneManager.sceneCountInBuildSettings)
        {
            SceneManager.LoadScene(getCurrentScene() + 1);
        }
        else
        {
            SceneManager.LoadScene(0);
        }
    }

    public static void LoadNextScene()
    {
        if (GetCurrentScene() + 1 < SceneManager.sceneCountInBuildSettings)
        {
            SceneManager.LoadScene(GetCurrentScene() + 1);
        }
        else
        {
            SceneManager.LoadScene(0);
        }
    }


    public void loadPreviousScene()
    {
        if(getCurrentScene() - 1 > 0)
        {
            SceneManager.LoadScene(getCurrentScene() - 1);
        }
        else
        {
            SceneManager.LoadScene(SceneManager.sceneCountInBuildSettings-1);
        }
    }

    public void reLoadCurrentScene()
    {
        SceneManager.LoadScene(getCurrentScene());
    }

    private int getCurrentScene()
    {
        int currentScene = SceneManager.GetActiveScene().buildIndex;
        return currentScene;
    }

    private static int GetCurrentScene()
    {
        int currentScene = SceneManager.GetActiveScene().buildIndex;
        return currentScene;
    }

    public void LoadSceneFromMainMenu(int level)
    {
        SceneManager.LoadScene(level+LoadOnStartup.mainMenuIndex);
    }


    public void ContinueGame()
    {

        if (GameSave.currentSave.lastCompletedLevel + 1 < SceneManager.sceneCountInBuildSettings)
        {
            SceneManager.LoadScene(GameSave.currentSave.lastCompletedLevel + 1);
        }
        else
        {
            Debug.Log("Game completed sending to last level");
            SceneManager.LoadScene(SceneManager.sceneCountInBuildSettings - 1);
        }

    }
}
