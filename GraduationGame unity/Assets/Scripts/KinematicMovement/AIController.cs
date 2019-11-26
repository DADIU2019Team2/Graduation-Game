using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIController : MonoBehaviour
{
    public List<AICharacterController> aiList;
    public Transform playerToFollow;
    public float lookAheadDistance;
    public float stopChaseRange = 0.2f;

    private void Update()
    {
        foreach (var controller in aiList)
        {
            AICharacterInputs input = new AICharacterInputs();
            float chaseDirection;
            if (playerToFollow.position.x > controller.transform.position.x)
            {
                chaseDirection = 1f;
            }
            else
            {
                chaseDirection = -1f;
            }

            if (Mathf.Abs(playerToFollow.position.x - controller.transform.position.x) < 0.4f)
            {
                chaseDirection = 0f;
            }

            var chaseInput = new Vector3(chaseDirection, 0f, 0f);
            input.MoveVector = chaseInput;
            input.lookAheadDistance = lookAheadDistance;
            controller.SetInputs(ref input);
        }
    }
}
