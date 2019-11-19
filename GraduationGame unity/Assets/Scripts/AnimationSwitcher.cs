using System;
using System.Collections;
using System.Collections.Generic;
using KinematicTest.controller;
using UnityEditor.Animations;
using UnityEngine;

public class AnimationSwitcher : MonoBehaviour
{
    public AnimatorController mmStates;
    public AnimatorController interactionStates;
    public MMAnimationController mmAnimatorController;
    public KinematicTestController characterController;

    public Animator animator;
    public Vector2 airLerp;
    public float airTime;
    public float t;

    private void Update()
    {
        /*//basic locomotion
        if (characterController.CurrentCharacterState == PlayerStates.Running &&
            characterController.Motor.GroundingStatus.IsStableOnGround)
        {
            //reset states
            if (characterController.JumpingThisFrame())
            {
                animator.runtimeAnimatorController = interactionStates;
                mmAnimatorController.StopMotionMatching();
                // set jump anim
                animator.SetTrigger("jump");

                
               

            }
            //start motion matching
            animator.runtimeAnimatorController = mmStates;
            mmAnimatorController.StartMotionMatching();
        }*/

        if ((characterController.Motor.GroundingStatus.IsStableOnGround &&
             !characterController.Motor.LastGroundingStatus.IsStableOnGround) ||
            (characterController.Motor.GroundingStatus.IsStableOnGround &&
             characterController.CurrentCharacterState == PlayerStates.Running))
        {
            animator.runtimeAnimatorController = mmStates;
            if(!mmAnimatorController.isMotionMatchingRunning)
            {
                animator.CrossFadeInFixedTime("run01", 0.3f);
            }
            
            mmAnimatorController.StartMotionMatching();
        }
        else
        {
            //stop motion matching
            animator.runtimeAnimatorController = interactionStates;
            mmAnimatorController.StopMotionMatching();

            //handle interaction states
            switch (characterController.CurrentCharacterState)
            {
                case PlayerStates.Idling:
                {
                    //set idle loop
                    animator.SetBool("isStanding", true);
                    break;
                }
                case PlayerStates.NoInput:
                {
                    //set idle loop
                    animator.SetBool("isIdling", true);
                    break;
                }
                case PlayerStates.CinematicIdle:
                {
                    //set idle loop
                    animator.SetBool("isStanding", true);
                    break;
                }
                case PlayerStates.Sliding:
                {
                    //set roll animation
                    animator.SetBool("isSliding", true);
                    if (characterController.JumpingThisFrame())
                    {
                        // set jump anim
                        animator.SetTrigger("jump");
                    }

                    break;
                }
                case PlayerStates.Running:
                {
                    animator.SetBool("isStanding", false);
                    animator.SetBool("onLedge?", false);
                    animator.ResetTrigger("ledgeDetected");
                    animator.SetBool("isFalling", false);


                    animator.SetBool("inAir", true);
                    // set fall anim


                    break;
                }
                case PlayerStates.LedgeGrabbing:
                {
                    //set ledge grab
                    animator.SetBool("inAir", false);
                    animator.SetBool("onLedge?", true);
                    animator.SetTrigger("ledgeDetected");
                    break;
                }
                case PlayerStates.Tired:
                {
                    //set wallkick
                    if (characterController.GetLedgeForward())
                    {
                        animator.SetBool("inAir", true);
                        animator.SetBool("onLedge?", false);
                        animator.ResetTrigger("ledgeDetected");
                    }
                    else
                    {
                        animator.SetBool("inAir", true);
                        animator.SetBool("onLedge?", false);
                        animator.ResetTrigger("ledgeDetected");
                    }

                    break;
                }
                case PlayerStates.Falling:
                {
                    //set falling again
                    animator.SetBool("isFalling", true);
                    break;
                }
            }
        }
    }
}