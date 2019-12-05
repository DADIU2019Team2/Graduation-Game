using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class DialogueManager : MonoBehaviour
{
    [SerializeField]
    private Localization fungusLocalization;
    public Language language;

    void Awake()
    {
        fungusLocalization = FindObjectOfType<Localization>();
    }
    void Start()
    {
        if (language.GetCurrentLanguage() == Language.LocalazationLanguage.Dansk)
        {
            fungusLocalization.SetActiveLanguage("DK", true);
            Debug.Log(fungusLocalization.ActiveLanguage);
        }
        else if (language.GetCurrentLanguage() == Language.LocalazationLanguage.English)
        {
            fungusLocalization.SetActiveLanguage("EN", true);
        }
    }

    public void SkipAllDialogue()
    {
        if (GameManager.GetGameState() != GameStateScriptableObject.GameState.mainGameplayLoop)
        {
            Flowchart.BroadcastFungusMessage("EndCinematicEarly");
            GameManager.DialogueEnd();
        }
    }

    public void SetDialogueLanguage(Language.LocalazationLanguage language)
    {
        if (language == Language.LocalazationLanguage.Dansk)
        {
            fungusLocalization.SetActiveLanguage("DK", true);
            Debug.Log(fungusLocalization.ActiveLanguage);
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
