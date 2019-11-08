using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

public class ToggleGameObject : MonoBehaviour
{
    //public VoidEvent gameObjectEnabled;
    //public VoidEvent gameObjectDisabled;
    public void toggleGameObject()
    {
        //Debug.Log("Here");
        gameObject.SetActive(!gameObject.activeSelf);
        /*if(gameObject.activeSelf == true && gameObjectEnabled != null)
        {
            gameObjectEnabled.Raise();
        }
        if(gameObject.activeSelf == false && gameObjectDisabled != null)
        {
            gameObjectDisabled.Raise();
        }*/
    }
}
