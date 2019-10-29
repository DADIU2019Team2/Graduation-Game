using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SmoothPlayerCamFollow : MonoBehaviour
{
    [SerializeField] private Transform playerToFollow;

    [SerializeField] private float smoothTime = 0.1f;

    [SerializeField] private Vector3 localOffSet;
    private Vector3 velocity;

    private void LateUpdate()
    {
        moveCam();
    }

    void moveCam()
    {
        Vector3 worldOffset = playerToFollow.TransformDirection(localOffSet);
        transform.position = Vector3.SmoothDamp(transform.position, playerToFollow.position + worldOffset, ref velocity, smoothTime);
        transform.LookAt(playerToFollow, Vector3.up);
    }
}
