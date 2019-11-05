using UnityEngine;
using MiniGame2.Events;

public class OnCollisionWithObjectEvent : MonoBehaviour
{
    public enum Filter { Tag, Object };
    public enum FilterEvent { Enter, Exit, Both};

    public Filter checkInteractionBy;
    public FilterEvent triggerEventOn;

    [SerializeField] private VoidEvent onEnterEvent;
    [SerializeField] private VoidEvent onExitEvent;
    [Tooltip("The Object that can trigger the collision event")]
    [SerializeField] private GameObject collidableObject;
    [SerializeField] private string tagToLookFor;
    [SerializeField] private bool isOneTimeEvent = true;
    private bool wasRaisedThisFrame = false;

    private void Start()
    {
        if(collidableObject == null)
        {
            Debug.Log("No collidable object have been set for OnCollisionWithObjectEvent component on " + gameObject.name);
        }
        if(onEnterEvent == null)
        {
            Debug.Log("Missing VoidEvent on " + gameObject.name);
        }
        if(onExitEvent == null)
        {
            Debug.Log("Missing VoidEvent on " + gameObject.name);
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (onEnterEvent == null)
            return;
        interactionRaisEvent(collision, onEnterEvent);
    }

    private void OnCollisionExit(Collision collision)
    {
        if (onExitEvent == null)
            return;
        interactionRaisEvent(collision, onExitEvent);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (onEnterEvent == null)
            return;
        interactionRaisEvent(other, onEnterEvent);
    }

    private void OnTriggerExit(Collider other)
    {
        if (onExitEvent == null)
            return;
        interactionRaisEvent(other, onExitEvent);
    }

    void interactionRaisEvent(Collision col, VoidEvent eventToTrigger)
    {
        wasRaisedThisFrame = false;
        if(checkInteractionBy == Filter.Tag)
        {
            if (col.gameObject.CompareTag(tagToLookFor))
            {
                eventToTrigger.Raise();
                if (isOneTimeEvent)
                {
                    gameObject.SetActive(false);
                    Destroy(gameObject);
                }
                wasRaisedThisFrame = true;
            }
        }
        //safety so we don't encounter a nullpointer if 
        if(checkInteractionBy == Filter.Object)
        {
            if (collidableObject == null)
            {
                return;
            }
            if (col.gameObject == collidableObject)
            {
                eventToTrigger.Raise();
                if (isOneTimeEvent)
                {
                    gameObject.SetActive(false);
                    Destroy(gameObject);
                }
                wasRaisedThisFrame = true;
            }
        }
    }

    void interactionRaisEvent(Collider other, VoidEvent eventToTrigger)
    {
        wasRaisedThisFrame = false;

        if(checkInteractionBy == Filter.Tag)
        {
            if (other.gameObject.CompareTag(tagToLookFor))
            {
                eventToTrigger.Raise();
                if (isOneTimeEvent)
                {
                    gameObject.SetActive(false);
                    Destroy(gameObject);
                }
                wasRaisedThisFrame = true;
            }
        }
        //safety so we don't encounter a nullpointer if 
        if(checkInteractionBy == Filter.Object)
        {
            if (collidableObject == null)
            {
                return;
            }
            if (other.gameObject == collidableObject)
            {
                eventToTrigger.Raise();
                if (isOneTimeEvent)
                {
                    gameObject.SetActive(false);
                    Destroy(gameObject);
                }
                wasRaisedThisFrame = true;
            }
        }
    }

}
