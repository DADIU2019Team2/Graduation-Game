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

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        initalRotation = transform.rotation;
        initialPosition = transform.position;
        initialIsActive = gameObject.activeSelf;
        initialUseGravity = rb.useGravity;
    }
    private void OnCollisionEnter(Collision collision)
    {
        //FallingPlatforms
        if (collision.gameObject.layer == LayerMask.NameToLayer("Player"))
        {
            StartCoroutine(startFalling(fallDelayTime));
        }
    }

    IEnumerator startFalling(float delay)
    {
        //Do some animation here ?
        yield return new WaitForSeconds(delay);
        rb.useGravity = true;        
    }

    public void OnResetLevel()
    {
        transform.position = initialPosition;
        transform.rotation = initalRotation;
        rb.useGravity = initialUseGravity;
        gameObject.SetActive(initialIsActive);
    }
}
