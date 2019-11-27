using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LoadScene : MonoBehaviour
{
    [Tooltip("The UI image that functions as a loading bar")]
    [SerializeField] private Image loadProgressBar;

    public void loadNextScene()
    {
        if (getCurrentScene() + 1 < SceneManager.sceneCountInBuildSettings)
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

    public void LoadScene1Async()
    {
        SceneManager.LoadSceneAsync(1);
    }


    public void StartLoadSceneAsyncWithProgressBar(int sceneIndex)
    {
        StartCoroutine(LoadSceneAsyncWithProgress(sceneIndex));
    }

    IEnumerator LoadSceneAsyncWithProgress(int sceneIndex)
    {
        AsyncOperation loadProgress = SceneManager.LoadSceneAsync(sceneIndex);

        
        while(!loadProgress.isDone)
        {
            //do the progess bar fill stuff
            //if(loadProgressBar != null)
            //{
            //    loadProgressBar.fillAmount = loadProgress.progress;
            //}
            Debug.Log("!Load Progress: " + loadProgress.progress);
            yield return new WaitForEndOfFrame();
           
        }
        Debug.Log("Done");
    }


    public void loadPreviousScene()
    {
        if (getCurrentScene() - 1 > 0)
        {
            SceneManager.LoadScene(getCurrentScene() - 1);
        }
        else
        {
            SceneManager.LoadScene(SceneManager.sceneCountInBuildSettings - 1);
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
        SceneManager.LoadScene(level + LoadOnStartup.mainMenuIndex);
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
