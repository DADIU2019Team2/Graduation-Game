using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class DialogueManager : MonoBehaviour
{
    [SerializeField]
    private Localization fungusLocalization;
    public void SkipAllDialogue()
    {
        if (GameManager.GetGameState() != GameStateScriptableObject.GameState.mainGameplayLoop)
        {
            Flowchart.BroadcastFungusMessage("EndCinematicEarly");
            GameManager.DialogueEnd();
        }
    }

    public static void SetDialogueLanguage(Language.LocalazationLanguage language)
    {

    }

    public void NextDialogueBox()
    {
        //Hopefully unnecessary
    }

    public void EndSceneFromDialogue()
    {
        //Not implemented yet. Needs to interface with save-load. (level-finished)
    }


}
