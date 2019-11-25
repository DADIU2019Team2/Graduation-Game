using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationTransitions : MonoBehaviour
{
    public void SetTrigger(string trigger)
    {
        this.gameObject.GetComponent<Animator>().SetTrigger(trigger);
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            SetTrigger("Test");
        }
    }
}
