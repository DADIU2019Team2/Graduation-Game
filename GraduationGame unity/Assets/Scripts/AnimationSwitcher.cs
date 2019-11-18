using System;
using System.Collections;
using System.Collections.Generic;
using KinematicTest.controller;
using UnityEngine;

public class AnimationSwitcher : MonoBehaviour
{
    public RuntimeAnimatorController mmStates;
    public RuntimeAnimatorController interactionStates;
    public MMAnimationController mmAnimatorController;
    public KinematicTestController characterController;

    public Animator animator;

    private void Update()
    {
        //basic locomotion
        if (characterController.CurrentCharacterState == PlayerStates.Running &&
            characterController.Motor.GroundingStatus.IsStableOnGround)
        {
            //reset states
            if (characterController.JumpingThisFrame())
            {
                animator.runtimeAnimatorController = interactionStates;
                mmAnimatorController.StopMotionMatching();
                // set jump anim
                Debug.Log("alma");
                animator.SetTrigger("jump");
            }
            else
            {
                //start motion matching
                animator.runtimeAnimatorController = mmStates;
                mmAnimatorController.StartMotionMatching();
            }
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

                    break;
                }
                case PlayerStates.NoInput:
                {
                    //set idle loop

                    break;
                }
                case PlayerStates.Sliding:
                {
                    //set roll animation

                    break;
                }
                case PlayerStates.Running:
                {
                    if (characterController.JumpingThisFrame())
                    {
                        // set jump anim
                        Debug.Log("alma");
                    }
                    else
                    {
                        // set fall anim
                    }

                    break;
                }
                case PlayerStates.LedgeGrabbing:
                {
                    //set ledge grab

                    break;
                }
                case PlayerStates.Tired:
                {
                    //set wallkick
                    if (characterController.GetLedgeForward())
                    {
                        // up
                    }
                    else
                    {
                        // away
                    }
                    break;
                }
                case PlayerStates.Falling:
                {
                    //set falling again

                    break;
                }
            }
        }
    }
}