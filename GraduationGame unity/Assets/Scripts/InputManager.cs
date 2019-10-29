using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputManager : MonoBehaviour
{
    private bool isDragging;

    Vector2 initPosition, endPosition;

    Vector2 swipeDirection;
    float swipeAngle;

    public CharacterMovement player;

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
                    swipeDirection = (endPosition - initPosition).normalized;
                    
                    swipeAngle = Vector2.Angle(Vector2.zero, swipeDirection);
                    
                    //TODO: Implement player using swipe here (SwipeAngle is all that is needed.):

                    break;
            }
        }
    }

}
