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
    private float tempGravityModifer= 0 ;
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
        //Debug.Log(globalGrav);
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
        tempGravityModifer = gravityModifier;
        //Do some animation here ?
        yield return new WaitForSeconds(delay);
        //rb.useGravity = true;   
        while (isFalling)
        {
            rb.AddForce(new Vector3(0, globalGrav * tempGravityModifer, 0), ForceMode.Acceleration);
            yield return new WaitForFixedUpdate();
            yield return new WaitForFixedUpdate();


        }
        if (!isFalling)
        {
            tempGravityModifer = 0;
            rb.useGravity = initialUseGravity;
            rb.velocity = Vector3.zero;
            rb.angularVelocity = Vector3.zero;
            rb.ResetInertiaTensor();
            transform.localPosition = initialPosition;
            transform.localRotation = initalRotation;
            transform.localScale = initialScale;
            gameObject.SetActive(initialIsActive);
            yield break;
        }
    }

    public void OnResetLevel()
    {
        
        //if (lastRoutine != null)
        //    StopCoroutine(lastRoutine);
        rb.useGravity = initialUseGravity;
        isFalling = false;
        tempGravityModifer = 0;
        rb.velocity = Vector3.zero;
        rb.angularVelocity = Vector3.zero;
        rb.ResetInertiaTensor();
        transform.localPosition = initialPosition;
        transform.localRotation = initalRotation;
        transform.localScale = initialScale;
        gameObject.SetActive(initialIsActive);

    }
}
