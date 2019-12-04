using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

public class RaiseOnSpace : MonoBehaviour
{
    [SerializeField] private VoidEvent eventToRaise;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            Debug.LogError("Raising an event for debug! Check: " + gameObject.name);
            eventToRaise.Raise();
        }
        if (Input.GetKeyDown(KeyCode.K))
        {
            Debug.LogError("Raising an event for debug! Check: " + gameObject.name);
            eventToRaise.Raise();
        }
    }
}
