using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameSave
{
    public static GameSave currentSave = null;

    public int lastCompletedLevel;
    public int checkPointToStartFrom;
    public bool isDoubleJumpUnlocked;
    public static Dictionary<string, bool> unlockables = new Dictionary<string, bool>()
    {
        //The things the player can unlock
        {"DoubleJump", false},
        {"skin1", false },
        {"skin2", false},
    };
    

    public GameSave()
    {
        if (currentSave == null)
        {
            currentSave = this;
           
        }
    }

    public void CompletedLevel(int level)
    {
        if (SceneManager.GetActiveScene().buildIndex > lastCompletedLevel)
        {
            GameSave.currentSave.lastCompletedLevel = SceneManager.GetActiveScene().buildIndex;
            UpdateCheckPoint(0);
        }
    }

    public static bool IsDoubleJumpUnlocked()
    {
        return GameSave.currentSave.isDoubleJumpUnlocked;
    }

    //update whether the player has unlocked something or not
    public void UpdateUnlocks(Unlockables key, bool value)
    {
        if (unlockables.ContainsKey(key.ToString()))
        {
            unlockables[key.ToString()] = value;
        }
    }
    //check whether the player has unlocked something or not
    public bool GetUnlocks(string key)
    {
        if (unlockables.ContainsKey(key))
        {
            return unlockables[key];
        }
        return false;
    }

    public void UpdateCheckPoint(int checkPoint)
    {
        currentSave.checkPointToStartFrom = checkPoint;
    }

}
