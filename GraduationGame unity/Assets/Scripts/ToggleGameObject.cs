using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ToggleGameObject : MonoBehaviour
{
    public void toggleGameObject()
    {
        gameObject.SetActive(!gameObject.activeSelf);
    }
}
