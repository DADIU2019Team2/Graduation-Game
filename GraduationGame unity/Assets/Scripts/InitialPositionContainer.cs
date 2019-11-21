using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InitialPositionContainer : MonoBehaviour
{
    public Vector3 initialPosition;
    public Quaternion InitialRotation;

    private void Awake()
    {
        initialPosition = transform.position;
        InitialRotation = transform.rotation;
    }
}
