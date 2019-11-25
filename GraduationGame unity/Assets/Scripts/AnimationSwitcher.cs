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
    private float slideTime;
    private float fallTime;

    [Tooltip("Ground prediction time in seconds")]
    public float predictionTime;

    [Tooltip("Time it takes to fade into/out of MM in frames")]
    public int fadeTimeInFrames;

    public Transform zoeRoot;
    private bool _isChangingWeight;
    private bool _isRightFootInFront;

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
            fallTime = 0f;
            animator.ResetTrigger("FallingGroundDetected");
        }
        else if (characterController.Motor.BaseVelocity.y < 0)
        {
            fallTime += Time.deltaTime;
            if (!characterController.Motor.GroundingStatus.IsStableOnGround &&
                PredictAboutToLand(predictionTime, out var v))
            {
                animator.SetTrigger("FallingGroundDetected");
            }
        }
        _isRightFootInFront = IsRightFootInFront();
        animator.SetBool("rightFootInFront", _isRightFootInFront);
        animator.SetFloat("fallBlend", fallTime);
        
        //On Landing
        if ((characterController.Motor.GroundingStatus.IsStableOnGround &&
             !characterController.Motor.LastGroundingStatus.IsStableOnGround) ||
            (characterController.Motor.GroundingStatus.IsStableOnGround &&
             characterController.CurrentCharacterState == PlayerStates.Running))
        {
            animator.SetFloat("fallBlend", 0f);


            foreach (var param in animator.parameters)
            {
                animator.SetBool(param.name, false);
            }
        }
        
        
        else
        {
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
                    slideTime = characterController.GetSlideNormalizedTime();
                    animator.SetFloat("slideBlend",slideTime);
                    animator.SetBool("isSliding", true);
                    if (characterController.JumpingThisFrame())
                    {
                        // set jump anim
                        animator.SetTrigger("slideJump");
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

    
    //now only projects down and with a smaller radius than Zoe's capsule, meaning it should mostly only collide with floor. Some edge cases still exist
    private bool PredictAboutToLand(float deltaTime, out Vector3 predictedPosition)
    {
        Vector3 grav = characterController.Gravity;
        Vector3 velocity = characterController.Motor.BaseVelocity;
        //velocity = veloctiy + grav * deltaTime;
        velocity = grav * deltaTime;


        Vector3 position = transform.parent.position;
        predictedPosition = position + velocity * deltaTime;
        Vector3 dir = velocity * deltaTime;
        return Physics.SphereCast(position, characterController.Motor.Capsule.radius - 0.1f, dir.normalized,
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
        Vector3 leftFootLocal =
            rootMatrix.MultiplyPoint3x4(animator.GetBoneTransform(HumanBodyBones.LeftFoot).position);
        Vector3 rightFootLocal =
            rootMatrix.MultiplyPoint3x4(animator.GetBoneTransform(HumanBodyBones.RightFoot).position);
        return (rightFootLocal.z > leftFootLocal.z);
    }
}