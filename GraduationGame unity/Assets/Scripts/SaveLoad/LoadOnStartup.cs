using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadOnStartup : MonoBehaviour
{
    public static int mainMenuIndex = 0;
    public SkinSwapper skinSwapper;
    public static int skinIndexLoad = 0;
    // Start is called before the first frame update
    private void Awake()
    {
        if (skinSwapper == null)
        {
            skinSwapper = GameObject.FindObjectOfType<SkinSwapper>();
        }
    }
    void Start()
    {
        Screen.SetResolution(1480,720,true);
        Screen.sleepTimeout= SleepTimeout.NeverSleep;
        mainMenuIndex = UnityEngine.SceneManagement.SceneManager.GetActiveScene().buildIndex;
        SaveLoad.Load();
        Time.timeScale = 1;
        Debug.LogWarning("Manually setting timescale to 1");
        Debug.Log("Skin Index" + GameSave.currentSave.skinIndexUsed);
        skinSwapper.SetSkinFromMainMenu(GameSave.currentSave.skinIndexUsed);
        skinIndexLoad = GameSave.currentSave.skinIndexUsed;
    }

    public void StartNewGame()
    {
        GameSave.currentSave.NewGameSave();
        SaveLoad.Save();
    }

    
    
}
