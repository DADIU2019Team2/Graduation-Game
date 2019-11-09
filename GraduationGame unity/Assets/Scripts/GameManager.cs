using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;
using System.Linq;

public class GameManager : MonoBehaviour
{

    private static GameStateScriptableObject.GameState gameState;
    private float originalTimescale;

    // transition related
    [Header("Transition Related")]
    public TransitionFader transitionFader;
    //public BoolVariable isSceneLaod;
    public FloatVariable sceneLoadFadeTime;
    public FloatVariable blackFadeTime;
    public static bool callOnce;
    private float transitionTime;
    private bool isSceneLoadTransition;

    [Header("Check If Active")]// bad i know
    public GameObject optionsMenu;

    private void Awake()
    {
        QualitySettings.vSyncCount = 0;
        Application.targetFrameRate = 120;
    }
    private void Start()
    {
        callOnce = true;
        isSceneLoadTransition = false;
        gameState = GameStateScriptableObject.GameState.levelStart;
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
                if(transitionFader.getAlpha() == 0)//have finished fading in
                {
                    ChangeGameState(GameStateScriptableObject.GameState.mainGameplayLoop);
                }
                /*Fade from black. 
                Nothing happens until player gives some sort of input to start the level. 
                Transitions into gameplay-state. */
                break;

            #region maingameplay
            case GameStateScriptableObject.GameState.mainGameplayLoop:
                if (optionsMenu.activeSelf) // if options menu gets entered
                {
                    originalTimescale = Time.timeScale;
                    Time.timeScale = 0f;
                    ChangeGameState(GameStateScriptableObject.GameState.optionsMenuOpened);
                }
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
                if(transitionFader.getAlpha() == 1) //faded to black
                {
                    DoResetObjects();
                    ChangeGameState(GameStateScriptableObject.GameState.levelStart);
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
                if (!optionsMenu.activeSelf) // if options menu is closed
                {
                    Time.timeScale = originalTimescale;
                    ChangeGameState(GameStateScriptableObject.GameState.mainGameplayLoop);
                }
                //Should pause all game-logic and behaviours. 
                //Time.timeScale = 0;

                break;

        }
        Debug.Log("Time scale = " + Time.timeScale);
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

    private void DoResetObjects()
    {
        var objectsToBeReset =  FindObjectsOfType<MonoBehaviour>().OfType<IOnSceneReset>();
        foreach (IOnSceneReset obj in objectsToBeReset)
        {
            obj.OnResetLevel();
        }
    }
}
