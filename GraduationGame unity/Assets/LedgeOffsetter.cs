using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicTest.controller;

public class LedgeOffsetter : MonoBehaviour
{
    [SerializeField]
    private Vec3Variable offset;
    [SerializeField]
    private KinematicTestController playerMovementController;

    private void Start()
    {
        if (playerMovementController == null)
        {
            Debug.LogWarning("PlayerMovementController unassigned in LedgeOffsetter.");
        }
    }

    void Update()
    {
        if (playerMovementController == null) { return; }
        if (playerMovementController.CurrentCharacterState == PlayerStates.LedgeGrabbing)
        {
            transform.position = playerMovementController.transform.position + offset.GetVector3();
        }
        else if (transform.localPosition != Vector3.zero)
        {
            transform.localPosition = Vector3.zero;
        }
    }
}
