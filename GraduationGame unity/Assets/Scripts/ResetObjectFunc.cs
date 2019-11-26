using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ResetObjectFunc : MonoBehaviour, IOnSceneReset
{
    private Vector3 initialPos;
    private Quaternion initialRot;
    private Vector3 initialScale;

    public Animator animator;

    [SerializeField] private string triggerToReset;

    [SerializeField] private OnCollisionWithObjectEvent collisionWithObjectToReset;

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
        if (animator != null)
        {
            //animator.StopPlayback();
            animator.ResetTrigger(triggerToReset);
            animator.SetTrigger("StopAnimation");
            animator.Play("Entry");
            //animator.ResetTrigger("StopAnimation");
        }
        transform.localPosition = initialPos;
        transform.localRotation = initialRot;
        transform.localScale = initialScale;
        if(collisionWithObjectToReset != null)
            collisionWithObjectToReset.OnResetLevel();
    }
}
