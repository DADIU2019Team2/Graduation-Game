using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ResetObjectFunc : MonoBehaviour, IOnSceneReset
{
    private Vector3 initialPos;
    private Quaternion initialRot;
    private Vector3 initialScale;

    private void Awake()
    {
        initialPos = transform.position;
        initialRot = transform.rotation;
        initialScale = transform.localScale;
    }

    public void OnResetLevel()
    {
        transform.position = initialPos;
        transform.rotation = initialRot;
        transform.localScale = initialScale;
    }
}
