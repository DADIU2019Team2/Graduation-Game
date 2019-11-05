using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;

public class SmoothPlayerCamFollow : MonoBehaviour
{
    [SerializeField] private Transform playerToFollow;
    //character controller for ref to movespeed/direction???
    //[SerializeField] private CharacterMovement moveScript; 
    [SerializeField] private KinematicCharacterMotor charMotor;

    [SerializeField] private float smoothTime = 0.1f;
    [Tooltip("The speed at which the camera rotates with... around 1.5 seems to be good")]
    [SerializeField] private float rotationSpeed = 1.5f;

    [SerializeField] private Vector3 localOffSet;
    private Vector3 worldOffset;
    [SerializeField] private float maxDistToLookAtPoint = 5f;
    private Vector3 camVelocity;
    private Vector3 localPosInfrontOfPlayer;

    private void Start()
    {
        localPosInfrontOfPlayer = new Vector3(2, 0, 0); //update this dynamicly
    }
    private void LateUpdate()
    {
        moveCam();
        updateLookAt();
    }

    void moveCam()
    {
        worldOffset = playerToFollow.TransformDirection(localOffSet);
        transform.position = Vector3.SmoothDamp(transform.position, playerToFollow.position + worldOffset, ref camVelocity, smoothTime);
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
        Vector3 charToFollowVelocity = charMotor.Velocity;

        Vector3 dynamicLookAtPoint = new Vector3(charToFollowVelocity.x / 2, 0 + worldOffset.y, 0);
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
        if(Application.isPlaying)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawLine(transform.position, updateLookAt());
        }
    }
}
