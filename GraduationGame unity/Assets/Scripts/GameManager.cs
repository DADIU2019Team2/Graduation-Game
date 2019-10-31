using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{

    [SerializeField]
    private static GameStateScriptableObject.GameState gameState;

    // Update is called once per frame
    void Update()
    {
        switch (gameState)
        {
            case GameStateScriptableObject.GameState.levelStart:
                /*Fade from black. 
                Nothing happens until player gives some sort of input to start the level. 
                Transitions into gameplay-state. */
                break;
            #region maingameplay
            case GameStateScriptableObject.GameState.mainGameplayLoop:
                //Main logic of the game goes on here. The player has control over Zoe. 
                break;
            #endregion maingameplay
            case GameStateScriptableObject.GameState.levelLoss:
                /*Fade to black, return all objects in scene to their initial states. 
                “Reload” scene and fade back into level-start state. 
                Zoe and camerashould be returned to most recent checkpoint met, rather than at the initial position at start of the level */
                break;
            case GameStateScriptableObject.GameState.cinematic:
                /*(No player control at all until they end)
                 – except skipping dialogue by tapping and swiping to skip to next player-controllable state. */
                break;
            case GameStateScriptableObject.GameState.levelComplete:
                /* Fade to black, load next scene, transition into level-start state.
                (Possibly set state to be level-start before calling the load-next-scene function) */
                break;
            case GameStateScriptableObject.GameState.optionsMenuOpened:
                //Should pause all game-logic and behaviours. 
                Time.timeScale = 0;

                break;
        }
    }

    public static GameStateScriptableObject.GameState GetGameState()
    {
        return gameState;
    }
}
