using System;
using System.Collections;
using System.Collections.Generic;
using KinematicCharacterController;
using KinematicTest.controller;
using UnityEngine;
using Random = UnityEngine.Random;

public class SentinelKiller : MonoBehaviour, IOnSceneReset
{
    public KinematicTestController controller;
    public GameObject sentinelLeft;
    public GameObject sentinelLaserLeft;
    public GameObject sentinelRight;
    public GameObject sentinelLaserRight;
    public Transform sentinelLeftPlatform;
    public Transform sentinelRightPlatform;
    public GameObject explosionObject;
    private ParticleSystem[] particles;
    public GameObject sentinelBrokenLeft;
    public GameObject sentinelBrokenRight;
    public float distance;
    public float killDistance;
    [Range(0, 100f)] public float explosionPower;
    public float explosionRadius;
    public float upwardsForce;
    private Vector3[] localPartPositions;
    private Rigidbody[] leftPartTransforms;
    private Rigidbody[] rightPartTransforms;
    private Vector3 force;
    private bool isDead;
    private Color gizmoColor;
    private PlayerStats playerStats;

    private void Awake()
    {
        playerStats = FindObjectOfType<LivePlayerStats>().playerStats;
        if (controller == null)
        {
            controller = FindObjectOfType<KinematicTestController>();
        }
        //save local positions of parts;
        leftPartTransforms = sentinelBrokenLeft.GetComponentsInChildren<Rigidbody>();
        rightPartTransforms = sentinelBrokenRight.GetComponentsInChildren<Rigidbody>();
        localPartPositions = new Vector3[leftPartTransforms.Length];
        for (int i = 0; i < leftPartTransforms.Length; i++)
        {
            localPartPositions[i] = leftPartTransforms[i].transform.localPosition;
        }

        particles = explosionObject.GetComponentsInChildren<ParticleSystem>();
    }

    // Start is called before the first frame update
    private void Update()
    {
        distance = Vector3.Distance(sentinelLeftPlatform.position, sentinelRightPlatform.position);
        if (distance < killDistance && !isDead)
        {
            Die();
        }
    }

    private void Die()
    {
        if (playerStats.getCurrentHealth() <= 0)
        {
            return;
        }
        controller.MakeInvulnerableForever();
        isDead = true;
        sentinelBrokenLeft.transform.position = sentinelLeftPlatform.position;
        sentinelBrokenRight.transform.position = sentinelRightPlatform.position;
        sentinelLeft.SetActive(false);
        sentinelRight.SetActive(false);
        sentinelLaserLeft.SetActive(false);
        sentinelLaserRight.SetActive(false);

        sentinelBrokenLeft.SetActive(true);
        sentinelBrokenRight.SetActive(true);

        var position = transform.position;
        //add force
        for (int i = 0; i < leftPartTransforms.Length; i++)
        {
            leftPartTransforms[i].AddExplosionForce(explosionPower, position, explosionRadius, upwardsForce);
            rightPartTransforms[i].AddExplosionForce(explosionPower, position, explosionRadius, upwardsForce);
        }

        for (int i = 0; i < particles.Length; i++)
        {
            particles[i].Play();
        }

        AkSoundEngine.RegisterGameObj(gameObject);
        AkSoundEngine.PostEvent("Explosion", gameObject);
        StartCoroutine(EndTheGame(5f));
    }

    public IEnumerator EndTheGame(float delay)
    {
        yield return new WaitForSeconds(delay);
        GameManager.RequestGameStateChange(GameStateScriptableObject.GameState.levelComplete);
    }

    public void OnResetLevel()
    {
        sentinelLeft.SetActive(true);
        sentinelRight.SetActive(true);
        sentinelLaserLeft.SetActive(true);
        sentinelLaserRight.SetActive(true);

        sentinelBrokenLeft.transform.position = sentinelLeftPlatform.position;
        sentinelBrokenRight.transform.position = sentinelRightPlatform.position;
        sentinelBrokenLeft.SetActive(false);
        sentinelBrokenRight.SetActive(false);
        for (int i = 0; i < leftPartTransforms.Length; i++)
        {
            leftPartTransforms[i].ResetInertiaTensor();
            rightPartTransforms[i].ResetInertiaTensor();
            leftPartTransforms[i].transform.localPosition = localPartPositions[i];
            leftPartTransforms[i].transform.rotation = Quaternion.identity;
            rightPartTransforms[i].transform.localPosition = localPartPositions[i];
            rightPartTransforms[i].transform.rotation = Quaternion.identity;
        }

        for (int i = 0; i < particles.Length; i++)
        {
            particles[i].Stop();
            particles[i].Clear();
        }

        isDead = false;
    }


    private void OnDrawGizmosSelected()
    {
        Gizmos.DrawWireSphere(transform.position, explosionRadius);
    }
}