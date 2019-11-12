using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class DebugGamestateDisplay : MonoBehaviour
{
    public TextMeshProUGUI text;
    private string curState;
    // Update is called once per frame
    void Update()
    {
        switch (GameManager.GetGameState())
        {
            case GameStateScriptableObject.GameState.levelStart:
                curState = "levelStart";
                break;
            case GameStateScriptableObject.GameState.mainGameplayLoop:
                curState = "MainGameplayLoop";
                break;
            case GameStateScriptableObject.GameState.levelLoss:
                curState = "LevelLoss";
                break;
            case GameStateScriptableObject.GameState.cinematic:
                curState = "cinematic";
                break;
            case GameStateScriptableObject.GameState.levelComplete:
                curState = "levelComplete";
                break;
            case GameStateScriptableObject.GameState.optionsMenuOpened:
                curState = "optionsMenuOpened";
                break;
        }
        text.text = "Gamestate = " + "\n" + curState;
    }
}
