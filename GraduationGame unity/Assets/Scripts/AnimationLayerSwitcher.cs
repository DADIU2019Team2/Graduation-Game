using System;
using System.Collections;
using System.Collections.Generic;
using KinematicTest.controller;
using UnityEngine;

public class AnimationLayerSwitcher : MonoBehaviour
{
    public KinematicTestController characterController;
    public Animator animator;
    public int fadeTimeInFrames;
    private bool _isChangingWeight;


    private void Update()
    {
        if (characterController.Motor.GroundingStatus.IsStableOnGround &&
            !characterController.Motor.LastGroundingStatus.IsStableOnGround)
        {
            //StartWeightChange(0);
            animator.SetBool("inAir", false);
        }
        else
        {
            if (characterController.CurrentCharacterState == PlayerStates.Running &&
                !characterController.Motor.GroundingStatus.IsStableOnGround)
            {
                // StartWeightChange(1);
                animator.SetBool("inAir", true);
            }
        }
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
}