using System;
using System.Collections;
using System.Collections.Generic;
using KinematicTest.controller;
using UnityEngine;
using Random = UnityEngine.Random;

public class AnimationLayerSwitcher : MonoBehaviour
{
    public KinematicTestController characterController;

    public Animator animator;
    private float slideTime;
    private float fallTime;

    [Tooltip("Ground prediction time in seconds")]
    public float predictionTime;

    public Transform zoeRoot;

    private bool _isChangingWeight;
    private bool _isRightFootInFront;

    [Tooltip("Time it takes to fade into/out of MM in frames")]
    public int fadeTimeInFrames;

    [Header("Jump type percentages")] public int normalJumpRatio;
    public int backflipRatio;
    public int cheatGainerRatio;

    private void Awake()
    {
        if (fadeTimeInFrames <= 0) fadeTimeInFrames = 1;
        if (predictionTime <= 0f) predictionTime = 0.1f;
    }

    private void Update()
    {
        //General in air stuff
        if (!characterController.Motor.GroundingStatus.FoundAnyGround && characterController.Motor.BaseVelocity.y < 0)
        {
            fallTime += Time.deltaTime;
            animator.SetFloat("fallBlend", fallTime);
            //Brace for impact

            if (!characterController.Motor.GroundingStatus.FoundAnyGround &&
                PredictAboutToLand(predictionTime, out var v))
            {
                animator.SetTrigger("FallingGroundDetected");
            }
        }

        //General running stuff
        if (characterController.Motor.GroundingStatus.FoundAnyGround)
        {
            _isRightFootInFront = IsRightFootInFront();
            animator.SetBool("rightFootInFront", _isRightFootInFront);

            if (characterController.GetSlidingThisFrame())
                animator.SetTrigger("slideInitiated");
            if (characterController.GetHitWallThisFrame())
                animator.SetTrigger("hitWall");
        }

        //ledge can be grabbed from slide or air so we have it here
        if (characterController.GetLedgingThisFrame())
            animator.SetTrigger("ledgingThisFrame");

        //On Landing
        if ((characterController.Motor.GroundingStatus.IsStableOnGround &&
             !characterController.Motor.LastGroundingStatus.IsStableOnGround) ||
            (characterController.Motor.GroundingStatus.IsStableOnGround &&
             characterController.CurrentCharacterState == PlayerStates.Running))
        {
            animator.SetFloat("fallBlend", 0f);
            animator.SetTrigger("justLanded");
        }


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
                animator.SetBool("isCinematicStanding", true);
                break;
            }
            case PlayerStates.CinematicIdle:
            {
                //set idle loop
                animator.SetBool("isCinematicStanding", true);
                break;
            }
            case PlayerStates.Sliding:
            {
                //set roll animation
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
                if (characterController.JumpingThisFrame())
                {
                    int jumpType = SelectJumpType(); // 0 = normal, 1 = backflip, 2 = C H E A T G A I N E R
                    animator.SetInteger("jumpType",jumpType);
                    animator.SetTrigger("jump");
                }

                animator.SetBool("isStanding", false);
                animator.SetBool("onLedge?", false);
                animator.ResetTrigger("ledgeDetected");
                animator.SetBool("isFalling", false);

                animator.ResetTrigger("jump");
                animator.SetBool("inAir", true);


                break;
            }
            case PlayerStates.LedgeGrabbing:
            {
                //set ledge grab
                animator.SetBool("onLedge?", true);
                if (characterController.JumpingThisFrame())
                {
                    animator.SetTrigger("ledgeJump");
                }

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

    private int SelectJumpType()
    {
        int r = Random.Range(1, normalJumpRatio + cheatGainerRatio + backflipRatio + 1);
        if (r > normalJumpRatio + backflipRatio)
        {
            return 2;
        }

        if (r > normalJumpRatio)
            return 1;
        return 0;
    }
}