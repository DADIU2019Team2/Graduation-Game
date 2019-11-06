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
        Debug.Assert(mirroredAngle(10) == 170, "10 mirrored = 170");
        Debug.Assert(mirroredAngle(190) == -10, "190 mirrored = -10");
        Debug.Assert(mirroredAngle(200) == -20, "200 mirrored = -20");
        Debug.Assert((-20 + 360) % 360 == 340, "-20%360 == 340");
        Debug.Assert(340 % 360 == 340);


        Debug.Assert(!(30 > (mirroredAngle(swipeAngleThresholds.swipeUpRightAngles0) + 360) % 360 && (mirroredAngle(swipeAngleThresholds.swipeUpRightAngles1) + 360) % 360 > 30),
         "Testing with 30 deg swipe backwards");
        Debug.Log((mirroredAngle(swipeAngleThresholds.swipeBackwardsAngles0) + 360) % 360);
        Debug.Log((mirroredAngle(swipeAngleThresholds.swipeBackwardsAngles1) + 360) % 360);

        Debug.Assert(Is_P3_between_P1_and_P2(swipeAngleThresholds.swipeUpRightAngles1, swipeAngleThresholds.swipeUpRightAngles0, 30), "swipeangletest with new function");



    }

    float mirroredAngle(float angle)
    {
        return 180 - angle;
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
                    if (swipeDirection.magnitude > 50f)
                    {
                        swipeAngle = Vector2.Angle(Vector2.right, swipeDirection);
                        isFacingRight = CharacterMovement.GetIsFacingRight();
                        mostRecentSwipeType = SwipeTypeOfAngle(swipeAngle, isFacingRight);
                        OnSwipeEvent.Raise();
                    }



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
            if (Is_P3_between_P1_and_P2(mirroredAngle(swipeAngleThresholds.swipeDownAngles1), mirroredAngle(swipeAngleThresholds.swipeDownAngles0), swipeAngle))
            {

                return SwipeType.swipeDown;
            }
            if (Is_P3_between_P1_and_P2(mirroredAngle(swipeAngleThresholds.swipeUpRightAngles1), mirroredAngle(swipeAngleThresholds.swipeUpRightAngles0), swipeAngle))
            {
                return SwipeType.swipeForwardUp;
            }
            if (Is_P3_between_P1_and_P2(mirroredAngle(swipeAngleThresholds.swipeBackwardsAngles1), mirroredAngle(swipeAngleThresholds.swipeBackwardsAngles0), swipeAngle))
            {
                return SwipeType.swipeBackwards;
            }
        }
        return SwipeType.none; //Stuff bugged out or the inputsettings on SwipeAngleThreshholds
    }

    bool Is_P3_between_P1_and_P2(double p1, double p2, double p3)
    {
        double p1_p2, p1_p3;
        p1_p2 = (p2 - p1 + 360)%360;
        p1_p3 = (p3 - p1 + 360)%360;

        return (p1_p2 <= 180) != (p1_p3 > p1_p2);
    }
}
