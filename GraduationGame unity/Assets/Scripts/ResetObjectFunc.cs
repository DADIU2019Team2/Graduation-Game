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
        initialPos = transform.position;
        initialRot = transform.rotation;
        initialScale = transform.localScale;
        if (animator == null)
        {
            animator = GetComponent<Animator>();
        }
    }

    public void OnResetLevel()
    {
        transform.position = initialPos;
        transform.rotation = initialRot;
        transform.localScale = initialScale;
        if (animator != null)
        {
            animator.Play("Entry");
        }
    }
}
