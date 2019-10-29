using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SmoothPlayerCamFollow : MonoBehaviour
{
    [SerializeField] private Transform playerToFollow;
    //character controller for ref to movespeed/direction???
    public MoveAroundOBJ moveScript; //this is a temp,,, should be replaced with actual script that makes char move

    [SerializeField] private float smoothTime = 0.1f;

    [SerializeField] private Vector3 localOffSet;
    private Vector3 camVelocity;
    private Vector3 localPosInfrontOfPlayer;

    private void Start()
    {
        localPosInfrontOfPlayer = new Vector3(2, 0, 0); //update this dynamicly
        moveScript = playerToFollow.GetComponent<MoveAroundOBJ>();

    }
    private void LateUpdate()
    {
        moveCam();
        updateLookAt();
    }

    void moveCam()
    {
        Vector3 worldOffset = playerToFollow.TransformDirection(localOffSet);
        transform.position = Vector3.SmoothDamp(transform.position, playerToFollow.position + worldOffset, ref camVelocity, smoothTime);
    }

    Vector3 updateLookAt()
    {
        //do some dynamic localPos infront of player
        Vector3 worldPosInFrontOfPlayer = Vector3.zero;
        if (moveScript.moveDir == MoveAroundOBJ.MoveDirection.Clockwise)
        {
            worldPosInFrontOfPlayer = playerToFollow.TransformPoint(localPosInfrontOfPlayer);
        }
        else if (moveScript.moveDir == MoveAroundOBJ.MoveDirection.CounterClockwise)
        {
            worldPosInFrontOfPlayer = playerToFollow.TransformPoint(-localPosInfrontOfPlayer);
        }
        transform.LookAt(worldPosInFrontOfPlayer, Vector3.up);
        return worldPosInFrontOfPlayer;
    }

    private void OnDrawGizmos()
    {        
        Gizmos.color = Color.red;
        Gizmos.DrawLine(transform.position, updateLookAt());
    }
}
