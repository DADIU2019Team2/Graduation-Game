using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObject/GameState")]
public class GameStateScriptableObject : ScriptableObject
{
    //[SerializeField] private bool isSetting;
    public enum GameState
    {
        levelStart,
        mainGameplayLoop,
        levelLoss,
        cinematic/*Dialogue and cinematic bullshit*/,
        levelComplete,
        optionsMenuOpened
    }

    public GameState gameState;

    public GameState GetGameState()
    {
        return gameState;
    }

    public void SetGameState(GameState _gameState)
    {
        gameState = _gameState;
    }
}

