using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ResetObjectFunc : MonoBehaviour, IOnSceneReset
{
    private Vector3 initialPos;
    private Quaternion initialRot;
    private Vector3 initialScale;

    public Animator animator;

    private void Awake()
    {
        initialPos = transform.localPosition;
        initialRot = transform.localRotation;
        initialScale = transform.localScale;
        if (animator == null)
        {
            animator = GetComponent<Animator>();
        }
    }

    public void OnResetLevel()
    {
        transform.localPosition = initialPos;
        transform.localRotation = initialRot;
        transform.localScale = initialScale;
        if (animator != null)
        {
            animator.Play("Entry");
        }
    }
}
