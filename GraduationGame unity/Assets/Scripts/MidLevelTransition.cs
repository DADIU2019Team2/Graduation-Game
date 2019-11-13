using System;
using System.Collections;
using System.Collections.Generic;
using MiniGame2.Events;
using UnityEngine;

public class MidLevelTransition : MonoBehaviour
{
    public enum TransitionType
    {
        Left90 = 1,
        Right90 = -1,
    }

    public TransitionType transitionType;
    public IntEvent transitionEvent;
    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            transitionEvent.Raise((int)transitionType);
        }

    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
            transitionType = transitionType == TransitionType.Left90 ? TransitionType.Right90 : TransitionType.Left90;
    }
}