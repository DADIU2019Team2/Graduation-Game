using System;
using System.Collections;
using System.Collections.Generic;
using KinematicTest.controller;
using UnityEngine;

public class AnimationSwitcher : MonoBehaviour
{
    public MMAnimationController mmAnimatorController;
    public KinematicTestController characterController;

    public Animator animator;
    private float jumpTime;
    private float fallTime;

    [Tooltip("Ground prediction time in seconds")]
    public float predictionTime;

    [Tooltip("Time it takes to fade into/out of MM in frames")]
    public int fadeTimeInFrames;

    public Transform zoeRoot;
    private bool _isChangingWeight;
    public bool alma;

    private void Awake()
    {
        if (fadeTimeInFrames <= 0) fadeTimeInFrames = 1;
        if (predictionTime <= 0f) predictionTime = 0.1f;
    }

    private void Update()
    {
        if (characterController.Motor.BaseVelocity.y > 0)
        {
            var startVelo = characterController.GetJumpPower();
            jumpTime = Mathf.InverseLerp(1, 0, characterController.Motor.BaseVelocity.y / startVelo);
            fallTime = 0f;
            animator.ResetTrigger("FallingGroundDetected");
        }
        else if (characterController.Motor.BaseVelocity.y < 0)
        {
            jumpTime = 0f;
            fallTime += Time.deltaTime;
            if (!characterController.Motor.GroundingStatus.IsStableOnGround && PredictAboutToLand(predictionTime, out var v))
            {
                animator.SetTrigger("FallingGroundDetected");
            }
        }

        alma = IsRightFootInFront();
        if (alma == true)
        {
            animator.SetBool("Alma", true);
           }

        else {
                animator.SetBool("Alma", false);
            }
        animator.SetFloat("riseBlend", jumpTime);
        animator.SetFloat("fallBlend", fallTime);

        if ((characterController.Motor.GroundingStatus.IsStableOnGround &&
             !characterController.Motor.LastGroundingStatus.IsStableOnGround) ||
            (characterController.Motor.GroundingStatus.IsStableOnGround &&
             characterController.CurrentCharacterState == PlayerStates.Running))
        {
            animator.SetFloat("riseBlend", 0f);
            animator.SetFloat("fallBlend", 0f);
            /*if(!mmAnimatorController.isMotionMatchingRunning)
            {
                animator.CrossFadeInFixedTime("run01", 0.3f); //Now THIS is what I call Jank!
            }*/


            foreach (var param in animator.parameters)
            {
                animator.SetBool(param.name, false);
            }

            /*animator.SetBool("MotionMatching",true);
            mmAnimatorController.StartMotionMatching();*/
        }
        else
        {
            //stop motion matching
            //animator.runtimeAnimatorController = interactionStates;
            /*animator.SetBool("MotionMatching",false);
            mmAnimatorController.StopMotionMatching();*/

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
                        if(Input.GetButton("Jump"))
                        {
                            animator.SetTrigger("jump");
                        }

                    
                        animator.SetBool("inAir", true);
                    // set fall anim


                    break;
                }
                case PlayerStates.LedgeGrabbing:
                {
                    //set ledge grab
                    animator.SetBool("onLedge?", true);
                    //animator.SetBool("inAir", true);
                    break;
                }
                case PlayerStates.Tired:
                {
                    //set wallkick
                    if (characterController.GetLedgeForward())
                    {
                        animator.SetBool("inAir", true);
                        animator.SetBool("onLedge?", false);
                    }
                    else
                    {
                        animator.SetBool("inAir", true);
                        animator.SetBool("onLedge?", false);
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

    private bool PredictAboutToLand(float deltaTime, out Vector3 predictedPosition)
    {
        Vector3 grav = characterController.Gravity;
        Vector3 velocity = characterController.Motor.BaseVelocity;
        velocity = velocity + grav * deltaTime;


        Vector3 position = transform.parent.position;
        predictedPosition = position + velocity * deltaTime;
        Vector3 dir = velocity * deltaTime;
        return Physics.SphereCast(position, characterController.Motor.Capsule.radius, dir.normalized,
            out var sphereCastHitInfo, dir.magnitude);
    }

    private void OnDrawGizmos()
    {
        var v = PredictAboutToLand(0.1f, out var hit);
        if (v)
        {
            Gizmos.color = Color.red;
        }
        else
        {
            Gizmos.color = Color.green;
        }

        Gizmos.DrawWireSphere(hit, characterController.Motor.Capsule.radius);
    }

    public void StartWeightChange(int desiredWeight)
    {
        if (_isChangingWeight)
        {
            StopCoroutine(nameof(SetLayerWeights));
        }

        StartCoroutine(SetLayerWeights(desiredWeight));
    }

    private IEnumerator SetLayerWeights(int desiredWeight)
    {
        _isChangingWeight = true;
        int interactionLayerIndex = animator.GetLayerIndex("Interactions");
        float startWeight = animator.GetLayerWeight(interactionLayerIndex);
        int step = 1;
        do
        {
            float weight = Mathf.Lerp(startWeight, desiredWeight, step / (float) fadeTimeInFrames);
            animator.SetLayerWeight(interactionLayerIndex, weight);
            yield return new WaitForSeconds(0f);
            step++;
        } while (step < fadeTimeInFrames + 1);

        _isChangingWeight = false;
    }

    private bool IsRightFootInFront()
    {
        Matrix4x4 rootMatrix = zoeRoot.worldToLocalMatrix;
        Vector3 leftFootLocal = rootMatrix.MultiplyPoint3x4(animator.GetBoneTransform(HumanBodyBones.LeftFoot).position);
        Vector3 rightFootLocal = rootMatrix.MultiplyPoint3x4(animator.GetBoneTransform(HumanBodyBones.RightFoot).position);
        return (rightFootLocal.z > leftFootLocal.z);
    }
}