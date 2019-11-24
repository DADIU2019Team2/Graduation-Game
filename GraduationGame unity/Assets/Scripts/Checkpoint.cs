using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(BoxCollider))]
public class Checkpoint : MonoBehaviour, IOnSceneReset
{
    //private enum ZoeFacedirection { Right, Left};
    //[SerializeField] private ZoeFacedirection forwardDirection;
    [SerializeField] private Transform spawnPoint;
    private bool triggeredThisPlaythrough = false;

    private BoxCollider trigger;

    [SerializeField]
    private Animator[] crystalAnimators;

    public void OnResetLevel()
    {
        triggeredThisPlaythrough = false;
    }

    private void Awake()
    {
        trigger = GetComponent<BoxCollider>();
        trigger.isTrigger = true;
        AkSoundEngine.RegisterGameObj(gameObject);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.layer == LayerMask.NameToLayer("Player") && triggeredThisPlaythrough == false)
        {
            SendMessageUpwards("SetCurrentCheckpoint", spawnPoint, SendMessageOptions.RequireReceiver);
            triggeredThisPlaythrough = true;
            AkSoundEngine.PostEvent("Checkpoint_Crystal", gameObject);

            foreach (Animator anim in crystalAnimators)
            {
                anim.Play("checkPointEntry");
            }
            //Maybe need to optimize this:
            //other.GetComponentInChildren<LivePlayerStats>().playerStats.resetHealth();
            //other.GetComponentInChildren<ZoeScarfColor>().OnResetLevel();
        }

    }


}
