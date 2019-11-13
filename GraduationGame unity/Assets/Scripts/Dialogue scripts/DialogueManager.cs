using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class DialogueManager : MonoBehaviour
{
    public void SkipAllDialogue()
    {
        Flowchart.BroadcastFungusMessage("EndCinematicEarly");
        GameManager.DialogueEnd();
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
