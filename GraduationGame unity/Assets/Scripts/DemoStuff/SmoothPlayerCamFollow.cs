using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;
using KinematicTest.controller;


public class SmoothPlayerCamFollow : MonoBehaviour
{
    private enum ZoeMoveDir { idle, up, down, left, right}
    private ZoeMoveDir currentMoveDir;

    [Header("Other component references")]
    [SerializeField] private Transform playerToFollow;
    [SerializeField] private KinematicCharacterMotor charMotor;

    [Header("Camera properties")]
    [Tooltip("The speed at which the camera rotates with... around 1.5 seems to be good")] [SerializeField]
    private float rotationSpeed = 1.5f;
    [SerializeField] private float XSmoothTime = 0.1f;
    [SerializeField] private float YSmoothTime = 0.7f;

    [SerializeField] private Vector3 localOffSet;
    [SerializeField] private float maxDistToLookAtPoint = 5f;
    [SerializeField] private float stopZoomOutDistance;
    public float zoomOutAfterSeconds;
    public float zoomOutDuration;

    [Header("Deadzone Definition")]
    [SerializeField] private float deadZoneXLeft;
    [SerializeField] private float deadZoneXRight;
    [SerializeField] private float deadZoneYTop = 3f;
    [SerializeField] private float deadZoneYBot = 2.5f;

    private float xDiff;
    private float yDiff;

    private Vector3 newdesiredPos;

    private Vector3 worldOffset;
    private Vector3 localPosInfrontOfPlayer;
    private Vector3 camVelocity;
    private Vector3 yVelocity;
    private float zoomOutTimer;
    private float zoomOutLerp;

    private void Start()
    {
        if (Mathf.Approximately(zoomOutDuration,0f))
            zoomOutDuration = 0.1f;
        localPosInfrontOfPlayer = new Vector3(2, 0, 0); //update this dynamicly
        currentMoveDir = ZoeMoveDir.idle;
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
            var normalizedZoom = zoomOutLerp / zoomOutDuration;
            var clampedZoom = Mathf.Clamp(normalizedZoom, 0f, 1f);
            var actualZoomOut = Mathf.Lerp(0f, stopZoomOutDistance, clampedZoom);
            worldOffset.z = localOffSet.z - actualZoomOut;
        }

        Vector3 tempDesiredPos = DesiredCamPos();
        float distToDesiredPos = (tempDesiredPos - transform.position).magnitude;

        //if(distToDesiredPos > 0.1)
        //{
        //}

        Vector3 desiredSmoothY = new Vector3(0, tempDesiredPos.y, 0);
        Vector3 smoothedY = Vector3.SmoothDamp(new Vector3(0, transform.position.y, 0), desiredSmoothY,
            ref yVelocity, YSmoothTime);
        //Do seperate smoothing speperate x and y

        Vector3 desiredSmoothX = new Vector3(tempDesiredPos.x, 0, 0);
        Vector3 smoothedX = Vector3.SmoothDamp(new Vector3(transform.position.x, 0, 0), desiredSmoothX,
            ref camVelocity, XSmoothTime);

        Vector3 camDesiredPosition = smoothedX + smoothedY;
        camDesiredPosition.z = tempDesiredPos.z;

        transform.position = camDesiredPosition;
    }

    Vector3 DesiredCamPos()
    {
        bool wasChanged = false;
        Vector3 oldDesiredPos = new Vector3();
        oldDesiredPos = transform.position;
        newdesiredPos = oldDesiredPos;

        xDiff = (playerToFollow.position.x + localOffSet.x) - (transform.position.x + localOffSet.x);
        yDiff = (playerToFollow.position.y + localOffSet.y) - (transform.position.y + localOffSet.y);

        if (xDiff > deadZoneXRight || CheckMoveDir(currentMoveDir))
        {
            newdesiredPos.x = playerToFollow.position.x + localOffSet.x;
            wasChanged = true;
            currentMoveDir = ZoeMoveDir.right;
        }
        if (xDiff < -deadZoneXLeft || CheckMoveDir(currentMoveDir))
        {
            newdesiredPos.x = playerToFollow.position.x + localOffSet.x;
            wasChanged = true;
            currentMoveDir = ZoeMoveDir.left;
        }

        if (charMotor.GroundingStatus.FoundAnyGround)
        {
            newdesiredPos.y = playerToFollow.position.y + localOffSet.y;
            wasChanged = true;
        }
        if (yDiff > deadZoneYTop || CheckMoveDir(currentMoveDir))
        {
            newdesiredPos.y = playerToFollow.position.y + localOffSet.y;
            wasChanged = true;
            currentMoveDir = ZoeMoveDir.up;
        }

        if(yDiff < -deadZoneYBot || CheckMoveDir(currentMoveDir))
        {
            newdesiredPos.y = playerToFollow.position.y + localOffSet.y;
            wasChanged = true;
            currentMoveDir = ZoeMoveDir.down;
        }

        newdesiredPos.z = playerToFollow.position.z + localOffSet.z;

        if (wasChanged)
            return newdesiredPos;
        else
            return oldDesiredPos;
    }

    bool CheckMoveDir(ZoeMoveDir dirToCheck)
    {
        switch (dirToCheck)
        {
            case ZoeMoveDir.up:
                if(charMotor.Velocity.y >= 0)
                {
                    return true;
                }
                break;
            case ZoeMoveDir.down:
                if(charMotor.Velocity.y <= 0)
                {
                    return true;
                }
                break;
            case ZoeMoveDir.left:
                if(charMotor.Velocity.x <= 0)
                {
                    return true;
                }
                break;
            case ZoeMoveDir.right:
                if(charMotor.Velocity.x >= 0)
                {
                    return true;
                }
                break;
        }
        return false;
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
        DrawCamDeadZone();
    }


    void DrawCamDeadZone()
    {
        bool drawLeft = true;
        bool drawRight = true;
        float tempDeadXLeft = deadZoneXLeft;
        float tempDeadXRight = deadZoneXRight;
        if (deadZoneXLeft == 0)
        {
            tempDeadXLeft = 5f;
            drawLeft = false;
        }
        if(deadZoneXRight == 0)
        {
            tempDeadXRight = 5f;
            drawRight = false;
        }

        Vector3 topLeftCorner = new Vector3(transform.position.x - tempDeadXLeft, transform.position.y + deadZoneYTop,
            playerToFollow.position.z -2);

        Vector3 topRightCorner = new Vector3(transform.position.x + tempDeadXRight, transform.position.y + deadZoneYTop,
            playerToFollow.position.z -2);

        Vector3 botLeftCorner = new Vector3(transform.position.x - tempDeadXLeft, transform.position.y - deadZoneYBot,
            playerToFollow.position.z -2);

        Vector3 botRightCorner = new Vector3(transform.position.x + tempDeadXRight, transform.position.y - deadZoneYBot,
            playerToFollow.position.z -2);

        Gizmos.color = Color.red;
        Gizmos.DrawLine(topLeftCorner, topRightCorner);
        if(drawLeft)
            Gizmos.DrawLine(topLeftCorner, botLeftCorner);
        Gizmos.DrawLine(botLeftCorner, botRightCorner);
        if(drawRight)
            Gizmos.DrawLine(botRightCorner, topRightCorner);
    }
}