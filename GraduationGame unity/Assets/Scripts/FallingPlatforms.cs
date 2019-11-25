using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class FallingPlatforms : MonoBehaviour, IOnSceneReset
{
    [SerializeField] private float fallDelayTime;
    private Rigidbody rb;
    private Vector3 initialPosition;
    private Quaternion initalRotation;
    private Vector3 initialScale;
    private bool initialUseGravity;
    private bool initialIsActive;
    private bool isFalling;

    private Coroutine lastRoutine;
    private float globalGrav;

    [SerializeField] private float gravityModifier = 1f;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        initalRotation = transform.localRotation;
        initialPosition = transform.localPosition;
        initialScale = transform.localScale;
        initialIsActive = gameObject.activeSelf;
        initialUseGravity = rb.useGravity;
        isFalling = initialUseGravity;
        globalGrav = Physics.gravity.y;
        Debug.Log(globalGrav);
    }

    public void startFallingPlatform()
    {
        if (!isFalling)
        {
            if (lastRoutine != null)
                StopCoroutine(lastRoutine);
            lastRoutine = StartCoroutine(startFalling(fallDelayTime));
        }
    }

    IEnumerator startFalling(float delay)
    {
        isFalling = true;
        //Do some animation here ?
        yield return new WaitForSeconds(delay);
        //rb.useGravity = true;   
        while (isFalling)
        {
            yield return new WaitForSeconds(0);
            rb.AddForce(new Vector3(0, globalGrav * gravityModifier, 0), ForceMode.Acceleration);
        }
    }

    public void OnResetLevel()
    {
        if (lastRoutine != null)
            StopCoroutine(lastRoutine);
        rb.useGravity = initialUseGravity;
        isFalling = false;
        rb.velocity = Vector3.zero;
        rb.ResetInertiaTensor();
        rb.angularVelocity = Vector3.zero;
        transform.localPosition = initialPosition;
        transform.localRotation = initalRotation;
        transform.localScale = initialScale;
        gameObject.SetActive(initialIsActive);
    }
}
