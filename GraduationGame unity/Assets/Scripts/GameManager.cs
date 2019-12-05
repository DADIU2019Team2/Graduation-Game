using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;
using System.Linq;
using KinematicTest.controller;
using UnityEngine.SceneManagement;

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
    public BoolVariable isSwipeAllowed;
    public static bool callOnce;
    private float transitionTime;
    private bool isSceneLoadTransition;

    [Header("Check If Active")]// bad i know
    public GameObject optionsMenu;

    [Header("Misc")]
    public KinematicTestController playerMovementController;
    public SmoothPlayerCamFollow camFollow;

    public delegate void OnGameStateChangeDelegate(GameStateScriptableObject.GameState gameState);
    public static event OnGameStateChangeDelegate GameStateChangeEvent;

    private float waitInLevelStart = 0.5f;
    private float waitTimer;
    bool startIncrementingLevelStart = false;
    private LivePlayerStats playerStats;

    private float waitForloadNextScene;
    private float timerForLoadNextScene;

    private void Awake()
    {
        QualitySettings.vSyncCount = 0;
        Application.targetFrameRate = 120;

        transitionFader.SetAlpha(1);
        gameState = GameStateScriptableObject.GameState.levelStart;
    }
    private void Start()
    {
        callOnce = true;
        isSceneLoadTransition = false;
        transitionFader.SetAlpha(1);

        waitForloadNextScene = sceneLoadFadeTime.getValue();
        timerForLoadNextScene = 0;

        if (playerMovementController == null)
        {
            playerMovementController = FindObjectOfType<KinematicTestController>();
        }
        if (playerStats == null)
        {
            playerStats = FindObjectOfType<LivePlayerStats>();
        }
    }

    // Update is called once per frame
    void Update()
    {
        switch (gameState)
        {
            case GameStateScriptableObject.GameState.levelStart:
                if (callOnce)
                {
                    Time.timeScale = 1;
                    timerForLoadNextScene = 0;
                    transitionFader.SetAlpha(1);
                    callOnce = false;
                    isSwipeAllowed.setBool(false);
                    startIncrementingLevelStart = true;
                    playerStats.OnResetLevel();
                    playerMovementController.TransitionToState(PlayerStates.CinematicIdle);
                    camFollow.SetCamFollowstate(CamFollowState.fullFollow);
                }
                if (startIncrementingLevelStart)
                {
                    waitTimer += Time.deltaTime;
                    //Debug.Log("Time:" + waitTimer);
                    if (waitTimer > waitInLevelStart)
                    {
                        waitTimer = 0f;
                        DoFade(true);
                        startIncrementingLevelStart = false;
                    }
                    else
                    {
                        transitionFader.SetAlpha(1);
                    }
                }

                if (transitionFader.getAlpha() == 0)//have finished fading in
                {
                    ChangeGameState(GameStateScriptableObject.GameState.mainGameplayLoop);
                }
                /*Fade from black. 
                Nothing happens until player gives some sort of input to start the level. 
                Transitions into gameplay-state. */
                break;

            case GameStateScriptableObject.GameState.mainGameplayLoop:
                if (callOnce)
                {
                    callOnce = false;
                    playerMovementController.TransitionToState(PlayerStates.Running);
                }
                isSwipeAllowed.setBool(true);
                if (optionsMenu.activeSelf) // if options menu gets entered
                {
                    originalTimescale = Time.timeScale;
                    Time.timeScale = 0f;
                    ChangeGameState(GameStateScriptableObject.GameState.optionsMenuOpened);
                }
                //Main logic of the game goes on here. The player has control over Zoe. 
                break;

            case GameStateScriptableObject.GameState.levelLoss:
                if (callOnce)
                {
                    isSceneLoadTransition = false;
                    DoFade(false);
                    callOnce = false;
                    camFollow.SetCamFollowstate(CamFollowState.NoFollow);
                }
                if (transitionFader.getAlpha() == 1) //faded to black
                {

                    playerMovementController.TransitionToState(PlayerStates.CinematicIdle);
                    DoResetObjects();
                    ChangeGameState(GameStateScriptableObject.GameState.levelStart);
                    camFollow.SetCamFollowstate(CamFollowState.fullFollow);
                }
                /*Fade to black, return all objects in scene to their initial states. 
                “Reload” scene and fade back into level-start state. 
                Zoe and camerashould be returned to most recent checkpoint met, rather than at the initial position at start of the level */
                break;

            case GameStateScriptableObject.GameState.cinematic:
                playerMovementController.TransitionToState(PlayerStates.NoInput);
                //Need to implement input blocking here.

                /*(No player control at all until they end)
                 – except skipping dialogue by tapping and swiping to skip to next player-controllable state. */
                break;

            case GameStateScriptableObject.GameState.levelComplete:
                if (callOnce)
                {
                    isSceneLoadTransition = false;
                    DoFade(false); //Fades to black
                    callOnce = false;
                    camFollow.SetCamFollowstate(CamFollowState.NoFollow);
                }

                timerForLoadNextScene += Time.deltaTime;
                if (timerForLoadNextScene >= waitForloadNextScene)
                {
                    //Last frame of the level - this is where we should load next level and stop wwise sound.
                    AkSoundEngine.StopAll();
                    timerForLoadNextScene = 0;
                    int nextScene = SceneManager.GetActiveScene().buildIndex + 1;
                    Debug.Log("Amount of scenes vs the index we want to load:" + SceneManager.sceneCountInBuildSettings + " vs " + nextScene);
                    if (SceneManager.sceneCountInBuildSettings - 1 < nextScene)
                    {
                        nextScene = 0;
                        //Should have this be the credits scene instead.
                    }
                    SceneManager.LoadScene(nextScene);
                }
                if (transitionFader.getAlpha() == 0)
                {
                    //For some reason this doesn't get called. Which is why the timerForLoadNextLevel code above exists.
                    //Last frame of the level - this is where we should load next level and stop wwise sound.
                    AkSoundEngine.StopAll();
                    int nextScene = SceneManager.GetActiveScene().buildIndex + 1;
                    if (SceneManager.sceneCountInBuildSettings - 1 > nextScene)
                    {
                        nextScene = 0;
                        //Should have this be the credits scene instead.
                    }
                    SceneManager.LoadScene(nextScene);
                }
                /* Fade to black, load next scene, transition into level-start state.
                (Possibly set state to be level-start before calling the load-next-scene function) */
                break;
            case GameStateScriptableObject.GameState.optionsMenuOpened:
                Debug.Log("OptionsMenuOpened");
                if (!optionsMenu.activeSelf) // if options menu is closed
                {
                    Time.timeScale = originalTimescale;
                    ChangeGameState(GameStateScriptableObject.GameState.mainGameplayLoop);
                }
                break;

        }
        //Debug.Log("Time scale = " + Time.timeScale);
    }

    public static GameStateScriptableObject.GameState GetGameState()
    {
        return gameState;
    }

    private static void ChangeGameState(GameStateScriptableObject.GameState desiredGameState)
    {
        gameState = desiredGameState;
        if (GameStateChangeEvent != null)
            GameStateChangeEvent(desiredGameState);
        callOnce = true;
    }

    public static bool RequestGameStateChange(GameStateScriptableObject.GameState desiredGamestate)
    {
        //do some stuff to make a gameState relation matrix....
        switch (gameState)
        {
            case GameStateScriptableObject.GameState.mainGameplayLoop:
                ChangeGameState(desiredGamestate);
                return true;
                break;
            case GameStateScriptableObject.GameState.cinematic:
                ChangeGameState(desiredGamestate);
                return true;
                break;
            default:
                return false;
                break;
        }
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
        var objectsToBeReset = FindObjectsOfType<MonoBehaviour>().OfType<IOnSceneReset>();
        //var objectsToBeReset = Resources.FindObjectsOfTypeAll<MonoBehaviour>().OfType<IOnSceneReset>(); doesn't work properly (gives null references in moving platforms)
        foreach (IOnSceneReset obj in objectsToBeReset)
        {
            obj.OnResetLevel();
        }
    }

    //
    public void ResetGame()
    {
        Time.timeScale = originalTimescale;
        ChangeGameState(GameStateScriptableObject.GameState.levelLoss);
    }

    public static void DialogueEnd()
    {
        GameManager.ChangeGameState(GameStateScriptableObject.GameState.mainGameplayLoop);
    }

    public void DialogueEndFromFungus()
    {
        GameManager.ChangeGameState(GameStateScriptableObject.GameState.mainGameplayLoop);
    }

    public static void DialogueStart()
    {
        GameManager.ChangeGameState(GameStateScriptableObject.GameState.cinematic);
    }
}
