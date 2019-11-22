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
    private bool initialUseGravity;
    private bool initialIsActive;
    private bool isFalling;

    private Coroutine lastRoutine;
    private float globalGrav;

    [SerializeField] private float gravityModifier = 1f;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        initalRotation = transform.rotation;
        initialPosition = transform.position;
        initialIsActive = gameObject.activeSelf;
        initialUseGravity = rb.useGravity;
        isFalling = initialUseGravity;
        globalGrav = Physics.gravity.y;
        
    }

    public void startFallingPlatform()
    {
        if(!isFalling)
            lastRoutine = StartCoroutine(startFalling(fallDelayTime));
    }

    IEnumerator startFalling(float delay)
    {
        isFalling = true;
        //Do some animation here ?
        yield return new WaitForSeconds(delay);
        //rb.useGravity = true;   
        while (isFalling)
        {
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
        transform.position = initialPosition;
        transform.rotation = initalRotation;
        gameObject.SetActive(initialIsActive);
    }
}
