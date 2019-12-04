using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class DialogueManager : MonoBehaviour
{
    [SerializeField]
    private static Localization fungusLocalization;
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
        if (language == Language.LocalazationLanguage.Dansk)
        {
            fungusLocalization.SetActiveLanguage("DK", true);
        }
        else if (language == Language.LocalazationLanguage.English)
        {
            fungusLocalization.SetActiveLanguage("EN", true);
        }
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
