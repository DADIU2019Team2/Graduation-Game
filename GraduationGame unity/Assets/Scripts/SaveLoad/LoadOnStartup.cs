﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadOnStartup : MonoBehaviour
{
    public static int mainMenuIndex = 0;

    // Start is called before the first frame update
    void Start()
    {
        mainMenuIndex = UnityEngine.SceneManagement.SceneManager.GetActiveScene().buildIndex;
        SaveLoad.Load();
    }

    public void StartNewGame()
    {
        GameSave.currentSave.NewGameSave();
        SaveLoad.Save();
    }

    
    
}
