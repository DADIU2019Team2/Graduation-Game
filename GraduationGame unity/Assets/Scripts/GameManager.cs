using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

public class GameManager : MonoBehaviour
{

    public static GameStateScriptableObject.GameState gameState;

    // transition related
    [Header("Transition Related")]
    public TransitionFader transitionFader;
    //public BoolVariable isSceneLaod;
    public FloatVariable sceneLoadFadeTime;
    public FloatVariable blackFadeTime;
    public static bool callOnce;
    private float transitionTime;
    private bool isSceneLoadTransition;

    private void Awake()
    {
        QualitySettings.vSyncCount = 0;
        Application.targetFrameRate = 120;
    }
    private void Start()
    {
        callOnce = true;
        isSceneLoadTransition = false;
    }

    // Update is called once per frame
    void Update()
    {
        switch (gameState)
        {
            case GameStateScriptableObject.GameState.levelStart:
                if (callOnce)
                {
                    DoFade(true);
                    callOnce = false;
                }
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
                if (callOnce)
                {
                    isSceneLoadTransition = false;
                    DoFade(false);
                    callOnce = false;
                }
                /*Fade to black, return all objects in scene to their initial states. 
                “Reload” scene and fade back into level-start state. 
                Zoe and camerashould be returned to most recent checkpoint met, rather than at the initial position at start of the level */
                break;
            case GameStateScriptableObject.GameState.cinematic:
                /*(No player control at all until they end)
                 – except skipping dialogue by tapping and swiping to skip to next player-controllable state. */
                break;
            case GameStateScriptableObject.GameState.levelComplete:
                if (callOnce)
                {
                    isSceneLoadTransition = true;
                    DoFade(false);
                    callOnce = false;
                }
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

    public static void ChangeGameState(GameStateScriptableObject.GameState desiredGameState)
    {
        gameState = desiredGameState;
        callOnce = true;
    }
    private void DoFade(bool fadeIn)
    {
        switch (isSceneLoadTransition)
        {
            case true:
                transitionTime = sceneLoadFadeTime.getValue();

                if (fadeIn)
                    transitionFader.fadeIn(transitionTime, true);
                else
                    transitionFader.fadeOut(transitionTime, true);
                break;

            case false:
                transitionTime = blackFadeTime.getValue();

                if (fadeIn)
                    transitionFader.fadeIn(transitionTime, false);
                else
                    transitionFader.fadeOut(transitionTime, false);
                break;
        }
    }
}
