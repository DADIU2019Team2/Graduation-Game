using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SmoothPlayerCamFollow : MonoBehaviour
{
    [SerializeField] private Transform playerToFollow;
    //character controller for ref to movespeed/direction???

    [SerializeField] private float smoothTime = 0.1f;

    [SerializeField] private Vector3 localOffSet;
    private Vector3 camVelocity;

    private void LateUpdate()
    {
        moveCam();
    }

    void moveCam()
    {
        Vector3 worldOffset = playerToFollow.TransformDirection(localOffSet);
        transform.position = Vector3.SmoothDamp(transform.position, playerToFollow.position + worldOffset, ref camVelocity, smoothTime);
    }

    void updateLookAt()
    {
        Vector3 distInfrontPlayer = new Vector3(0,0,5); //update this dynamicly
        Vector3 posInFrontOfPlayer = playerToFollow.TransformDirection(distInfrontPlayer);
        transform.LookAt(posInFrontOfPlayer, Vector3.up);
    }
}
