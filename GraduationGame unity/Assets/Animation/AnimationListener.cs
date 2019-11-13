using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicTest.controller;
using KinematicTest.player;

public class AnimationListener : MonoBehaviour
{
    Animator animator;
    public KinematicTestController testController;
    public PlayerStates playerState;

    // Start is called before the first frame update
    void Start()
    {
        animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        playerState = testController.CurrentCharacterState;
        bool isOnGround = testController.Motor.GroundingStatus.IsStableOnGround;
        bool isJumping = testController.Motor.BaseVelocity.y > 0.2f ? true :false;
        //bool isFalling = testController.Motor.BaseVelocity.y < -0.2f ? true : false;
        bool directionLeft = testController.Motor.BaseVelocity.x < 0;
        //bool directionRight = testController.Motor.BaseVelocity.x > 0;

        //Debug.Log("Controller velocity is " + testController.Motor.BaseVelocity.x);
        animator.SetBool("isSliding", false);
        animator.SetBool("isFalling", false);
        animator.SetBool("inAir", false);
        //animator.SetBool("directionLeft", false);
        //animator.SetBool("directionright", false);
        //animator.SetBool("inAir", false);
        //animator.SetBool("jump",true);

        if (directionLeft)
        {
            animator.SetBool("directionLeft", true);
            animator.SetBool("directionRight", false);
            transform.rotation = Quaternion.Euler(0, -90, 0);
            
        }
        else
        {
            animator.SetBool("directionRight", true);
            animator.SetBool("directionLeft", false);
            transform.rotation = Quaternion.Euler(0, 90, 0);
        }
        if (isJumping)
        {
            animator.SetTrigger("jump");
            //animator.SetBool("jump", true);
        }

        if (!isOnGround)
        {
            animator.SetBool("inAir", true);
            animator.ResetTrigger("jump");
        }
        //if (isFalling)
       // {
            //animator.SetBool("isFalling", true);
        //}

        switch (playerState)
        {
            case PlayerStates.Sliding:
                animator.SetBool("isSliding", true);
                break;
            case PlayerStates.Running:

                break;
            case PlayerStates.Falling:

                break;
            case PlayerStates.Idling:

                break;

        }
    }
}
