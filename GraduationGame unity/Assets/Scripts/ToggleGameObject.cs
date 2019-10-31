using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ToggleGameObject : MonoBehaviour
{
    public void toggleGameObject()
    {
        Debug.Log("Here");
        gameObject.SetActive(!gameObject.activeSelf);
    }
}
