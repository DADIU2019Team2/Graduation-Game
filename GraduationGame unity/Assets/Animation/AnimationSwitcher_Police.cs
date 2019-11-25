using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationSwitcher_Police : MonoBehaviour
{

    public Animator animator;
    public AICharacterController ai;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (ai.CurrentAIState != AIStates.Idling)
        {
            animator.SetBool("isChasing", true);
            animator.SetBool("idling", false);
            animator.ResetTrigger("rotate");
        }
        /*if (dude is rotating)
        {
            animator.SetTrigger("rotate");
        } 
        */
        else
        {
            animator.SetBool("idling", true);
            animator.SetBool("isChasing", false);
        }
    }
}
