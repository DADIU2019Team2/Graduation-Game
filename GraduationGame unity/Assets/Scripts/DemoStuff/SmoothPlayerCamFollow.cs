using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;
using KinematicTest.controller;

public class SmoothPlayerCamFollow : MonoBehaviour
{
    [SerializeField] private Transform playerToFollow;

    //character controller for ref to movespeed/direction???
    //[SerializeField] private CharacterMovement moveScript; 
    [SerializeField] private KinematicCharacterMotor charMotor;

    [SerializeField] private float smoothTime = 0.1f;

    [Tooltip("The speed at which the camera rotates with... around 1.5 seems to be good")] [SerializeField]
    private float rotationSpeed = 1.5f;

    [SerializeField] private Vector3 localOffSet;
    private Vector3 worldOffset;
    [SerializeField] private float maxDistToLookAtPoint = 5f;
    private Vector3 camVelocity;
    private Vector3 localPosInfrontOfPlayer;
    private float zoomOutTimer;
    private float zoomOutLerp;
    [SerializeField] private float stopZoomOutDistance;
    public float zoomOutAfterSeconds;
    public float zoomOutDuration;

    private void Start()
    {
        if (Mathf.Approximately(zoomOutDuration,0f))
            zoomOutDuration = 0.1f;
        localPosInfrontOfPlayer = new Vector3(2, 0, 0); //update this dynamicly
    }

    private void LateUpdate()
    {
        if (Mathf.Approximately(charMotor.BaseVelocity.magnitude, 0f))
        {
            zoomOutTimer += Time.deltaTime;
        }
        else
        {
            zoomOutTimer = 0f;
            zoomOutLerp = 0f;
        }

        moveCam();
        updateLookAt();
    }

    void moveCam()
    {
        worldOffset = localOffSet;
        if (zoomOutTimer >= zoomOutAfterSeconds)
        {
            zoomOutLerp += Time.deltaTime;
            var alma = zoomOutLerp / zoomOutDuration;
            var korte = Mathf.Clamp(alma, 0f, 1f);
            var actualZoomOut = Mathf.Lerp(0f, stopZoomOutDistance, korte);
            worldOffset.z = localOffSet.z - actualZoomOut;
        }

        transform.position = Vector3.SmoothDamp(transform.position, playerToFollow.position + worldOffset,
            ref camVelocity, smoothTime);
    }

    Vector3 updateLookAt()
    {
        Vector3 desiredLookAtPoint = updateDesiredLookAtPointWorld();

        Quaternion targetRotation = Quaternion.LookRotation(desiredLookAtPoint - transform.position, Vector3.up);

        transform.rotation = Quaternion.Lerp(transform.rotation, targetRotation, rotationSpeed * Time.deltaTime);


        return desiredLookAtPoint;
    }

    Vector3 updateDesiredLookAtPointWorld()
    {
        //do some dynamic localPos infront of player
        Vector3 charToFollowVelocity = Quaternion.Inverse(playerToFollow.rotation) *
                                       Quaternion.Euler(0, 90 * KinematicTestController.runningRight, 0) *
                                       charMotor.Velocity;

        Vector3 dynamicLookAtPoint = new Vector3(0, 0 + worldOffset.y,
            charToFollowVelocity.x / 2 * KinematicTestController.runningRight);
        //Debug.Log("Dynamic lookat point = " + dynamicLookAtPoint);
        float distToLookatPoint = Mathf.Clamp(dynamicLookAtPoint.magnitude, 0f, maxDistToLookAtPoint);

        localPosInfrontOfPlayer = dynamicLookAtPoint.normalized * distToLookatPoint;
        //Debug.Log("local in-front of player = " + localPosInfrontOfPlayer);

        Vector3 desiredWorldPosInFrontOfPlayer = playerToFollow.TransformPoint(localPosInfrontOfPlayer.x,
            localPosInfrontOfPlayer.y, localPosInfrontOfPlayer.z);
        return desiredWorldPosInFrontOfPlayer;
    }

    private void OnDrawGizmos()
    {
        if (Application.isPlaying)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawLine(transform.position, updateLookAt());
        }
    }
}