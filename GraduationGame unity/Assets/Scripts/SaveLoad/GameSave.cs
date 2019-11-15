using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


[System.Serializable]
public class GameSave
{
    public static GameSave currentSave = new GameSave();

    public int lastCompletedLevel;
    public bool isDoubleJumpUnlocked;
    [SerializeField]
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
            Debug.Log("is null");
            currentSave = this;
            unlockables = new Dictionary<string, bool>()
        {
            //The things the player can unlock
            {"DoubleJump", false},
            {"skin1", false },
            {"skin2", false},
        };

        }
    }

    public static GameSave GetGameSave()
    {
        if (currentSave == null)
        {
            Debug.Log("didn't exits");
        currentSave = new GameSave();

        }
        else
        {
            Debug.Log("Did exist");
        }
        return currentSave;
    }

    public void CompletedLevel()
    {
        Debug.Log(SceneManager.GetActiveScene().buildIndex + " index");
        Debug.Log(LoadOnStartup.mainMenuIndex + " main index");
        if (SceneManager.GetActiveScene().buildIndex-LoadOnStartup.mainMenuIndex > lastCompletedLevel)
        {
            Debug.Log("completed level, will now save");
            GameSave.currentSave.lastCompletedLevel = SceneManager.GetActiveScene().buildIndex-LoadOnStartup.mainMenuIndex;
            SaveLoad.Save();
        }
        else
        {
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
        //Debug.Log(unlockables.Count + "count");
        //Debug.Log(key.ToString() + "String");
        if (currentSave.unlockables.ContainsKey(key.ToString()))
        {
            currentSave.unlockables[key.ToString()] = value;
        }
    }
    //check whether the player has unlocked something or not
    public bool GetUnlocks(Unlockables key)
    {
        
        //Debug.Log(key.ToString() + "String");
        //Debug.Log(currentSave.lastCompletedLevel + "last completede");
        bool temp = currentSave.unlockables.ContainsKey("skin1");
        if (currentSave.unlockables.ContainsKey(key.ToString()))
        {
            return currentSave.unlockables[key.ToString()];
        }
        return false;
    }

}
