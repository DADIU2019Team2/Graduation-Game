using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelXEndScript : MonoBehaviour
{
    public Animator animator;
    // Start is called before the first frame update
    public void DisableAnimator()
    {
        animator.enabled = false;
    }

    public void EnableAndStartAnimator()
    {
        animator.enabled = true;
    }

    // Update is called once per frame
    void Update()
    {

    }
}
