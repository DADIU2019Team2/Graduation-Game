using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UnlockedLevels : MonoBehaviour
{
    public int levelNumber;
    private void Start()
    {
        IsSceneUnlocked(levelNumber);
    }

    public void IsSceneUnlocked(int level)
    {
        SaveLoad.saveGame.lastCompletedLevel = 5;
        if (SaveLoad.saveGame.lastCompletedLevel >= level-1)
        {
            gameObject.GetComponent<Button>().interactable = true;
            return;
        }
        else
        {
            
                gameObject.GetComponent<Button>().interactable = false;
           
        }




    }
}
