using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

public class InputManager : MonoBehaviour
{
    public enum SwipeType
    {
        swipeForwardUp /*For forward jumps */,
        swipeBackwards /*For changing direction and ledge-jumping backwards */,
        swipeDown /*For sliding and dropping down ledges */,
        none //only ever happening if a bug occured.
    }

    private bool isDragging;
    Vector2 initPosition, endPosition;
    Vector2 swipeDirection;
    float swipeAngle;
    private bool isFacingRight;
    public SwipeAngleThresholds swipeAngleThresholds;
    public VoidEvent OnSwipeEvent;
    private static SwipeType mostRecentSwipeType;



    private void Start()
    {
        //Debug.Assert(mirroredAngle(10) == 170, "10 mirrored = 170");
        //Debug.Assert(mirroredAngle(190) == -10, "190 mirrored = -10");


    }

    float mirroredAngle(float angle)
    {
        return 180 + 360 - angle; 
    }

    void Update()
    {
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            switch (touch.phase)
            {
                case TouchPhase.Began:
                    initPosition = touch.position;
                    break;

                case TouchPhase.Ended:
                    endPosition = touch.position;
                    swipeDirection = (endPosition - initPosition);
                    swipeAngle = Vector2.Angle(Vector2.right, swipeDirection);
                    isFacingRight = CharacterMovement.GetIsFacingRight(); 
                    mostRecentSwipeType = SwipeTypeOfAngle(swipeAngle, isFacingRight);
                    OnSwipeEvent.Raise();

                    break;
            }
        }
    }

    //Should take into account different input-types when they are implemented.
    public static SwipeType GetMostRecentInputType()
    {
        return mostRecentSwipeType; 
    }
    public SwipeType SwipeTypeOfAngle(float swipeAngle, bool isFacingRight)
    {

        if (isFacingRight)
        {
            if (swipeAngle > swipeAngleThresholds.swipeUpRightAngles0 && swipeAngle < swipeAngleThresholds.swipeUpRightAngles1)
            {
                return SwipeType.swipeForwardUp;
            }
            if (swipeAngle > swipeAngleThresholds.swipeBackwardsAngles0 && swipeAngle < swipeAngleThresholds.swipeBackwardsAngles1)
            {
                return SwipeType.swipeBackwards;
            }
            if (swipeAngle > swipeAngleThresholds.swipeDownAngles0 && swipeAngle < swipeAngleThresholds.swipeDownAngles1)
            {
                return SwipeType.swipeDown;
            }
        }
        else if (!isFacingRight)
        {
            if (swipeAngle < mirroredAngle(swipeAngleThresholds.swipeUpRightAngles0)%360 && swipeAngle > mirroredAngle(swipeAngleThresholds.swipeUpRightAngles1)%360)
            {
                return SwipeType.swipeForwardUp;
            }
            if (swipeAngle < mirroredAngle(swipeAngleThresholds.swipeBackwardsAngles0)%360 && swipeAngle > mirroredAngle(swipeAngleThresholds.swipeBackwardsAngles1)%360)
            {
                return SwipeType.swipeBackwards;
            }
            if (swipeAngle < mirroredAngle(swipeAngleThresholds.swipeDownAngles0)%360 && swipeAngle > mirroredAngle(swipeAngleThresholds.swipeDownAngles1)%360)
            {
                return SwipeType.swipeDown;
            }
        }
        return SwipeType.none; //Stuff bugged out or the inputsettings on SwipeAngleThreshholds
    }

}
