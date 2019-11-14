using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


[System.Serializable]
public class GameSave
{
    public static GameSave currentSave = null;

    public int lastCompletedLevel;
    public bool isDoubleJumpUnlocked;
    public Dictionary<string, bool> unlockables = new Dictionary<string, bool>()
    {
        //The things the player can unlock
        {"DoubleJump", false},
        {"skin1", false },
        {"skin2", false},
    };
    
    public static int skinIndexUsed = 0;

    public GameSave()
    {
        if (currentSave == null)
        {
            currentSave = this;
           
        }
    }

    public static GameSave GetGameSave()
    {
        if (currentSave == null)
        {
        currentSave = new GameSave();

        }
        return currentSave;
    }

    public void CompletedLevel(int level)
    {
        if (SceneManager.GetActiveScene().buildIndex-LoadOnStartup.mainMenuIndex > lastCompletedLevel)
        {
            GameSave.currentSave.lastCompletedLevel = SceneManager.GetActiveScene().buildIndex-LoadOnStartup.mainMenuIndex;
            SaveLoad.Save();
        }
    }

    public static bool IsDoubleJumpUnlocked()
    {
        return GameSave.currentSave.isDoubleJumpUnlocked;
    }

    //update whether the player has unlocked something or not
    public void UpdateUnlocks(Unlockables key, bool value)
    {
        Debug.Log(currentSave.unlockables.Keys + "current save");
        if (GameSave.currentSave.unlockables.ContainsKey(key.ToString()))
        {
            GameSave.currentSave.unlockables[key.ToString()] = value;
        }
    }
    //check whether the player has unlocked something or not
    public bool GetUnlocks(Unlockables key)
    {
        Debug.Log("null??" + currentSave.lastCompletedLevel);
        if (currentSave.unlockables.ContainsKey(key.ToString()))
        {
            return currentSave.unlockables[key.ToString()];
        }
        return false;
    }

}
