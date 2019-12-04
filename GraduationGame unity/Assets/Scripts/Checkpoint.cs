using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

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

    public enum RespawnRunDirection
    {
        RunRight, RunLeft
    }
    public RespawnRunDirection respawnRunDirection;
    public VoidEvent respawnFacingLeftEvent, respawnFacingRightEvent;

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

            //Liveplayerstats listens for this and uses it for setting the right direction in OnReset
            if (respawnRunDirection == RespawnRunDirection.RunLeft)
            {
                respawnFacingLeftEvent.Raise();
            }
            else
            {
                respawnFacingRightEvent.Raise();
            }

            if (crystalAnimators[0] == null)
            {
                //Find crystal animator.
            }
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
