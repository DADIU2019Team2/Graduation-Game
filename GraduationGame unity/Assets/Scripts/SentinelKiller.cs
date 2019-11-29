using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;

public class SentinelKiller : MonoBehaviour, IOnSceneReset
{
    public GameObject sentinelLeft;
    public GameObject sentinelRight;
    public GameObject sentinelBrokenLeft;
    public GameObject sentinelBrokenRight;
    public float distance;
    public float killDistance;
    public Vector3 explosionPoint;
    private Vector3[] localPartPositions;
    private Rigidbody[] leftPartTransforms;
    private Rigidbody[] rightPartTransforms;
    private Vector3 force;
    private bool isDead;
    private void Awake()
    {
        //save local positions of parts;
        leftPartTransforms = sentinelBrokenLeft.GetComponentsInChildren<Rigidbody>();
        rightPartTransforms = sentinelBrokenRight.GetComponentsInChildren<Rigidbody>();
        localPartPositions = new Vector3[leftPartTransforms.Length];
        for (int i = 0; i < leftPartTransforms.Length; i++)
        {
            localPartPositions[i] = leftPartTransforms[i].transform.localPosition;
        }
    }

    // Start is called before the first frame update
    private void Update()
    {
        distance = Vector3.Distance(sentinelLeft.transform.position, sentinelRight.transform.position);
        if (distance < killDistance && !isDead)
        {
            Die();
        }
    }

    private void Die()
    {
        isDead = true;
        sentinelBrokenLeft.transform.position = sentinelLeft.transform.position;
        sentinelBrokenRight.transform.position = sentinelRight.transform.position;
        sentinelLeft.SetActive(false);
        sentinelRight.SetActive(false);
        sentinelBrokenLeft.SetActive(true);
        sentinelBrokenRight.SetActive(true);
        
        
        //add force
        for (int i = 0; i < leftPartTransforms.Length; i++)
        {
            leftPartTransforms[i].AddExplosionForce(10000f,explosionPoint,100f);
            rightPartTransforms[i].AddExplosionForce(10000f,explosionPoint,100f);
        }
        
        
        
    }

    public void OnResetLevel()
    {
        isDead = false;
        sentinelBrokenLeft.transform.position = sentinelLeft.transform.position;
        sentinelBrokenRight.transform.position = sentinelRight.transform.position;
        sentinelLeft.SetActive(true);
        sentinelRight.SetActive(true);
        sentinelBrokenLeft.SetActive(false);
        sentinelBrokenRight.SetActive(false);
        for (int i = 0; i < leftPartTransforms.Length; i++)
        {
            leftPartTransforms[i].transform.localPosition = localPartPositions[i];
            leftPartTransforms[i].transform.rotation = Quaternion.identity;
            rightPartTransforms[i].transform.localPosition = localPartPositions[i];
            rightPartTransforms[i].transform.rotation = Quaternion.identity;
            leftPartTransforms[i].ResetInertiaTensor();
            rightPartTransforms[i].ResetInertiaTensor();
        }
    }
}