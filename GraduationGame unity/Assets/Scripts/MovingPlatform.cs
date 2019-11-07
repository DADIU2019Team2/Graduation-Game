using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KinematicCharacterController;


public class MovingPlatform : MonoBehaviour, IMoverController
{
    public PhysicsMover Mover;

    public Waypoint currentWaypoint;
    private Vector3 _destination;

    public LayerMask activationLayers;
    public enum ActivationType { none, player, trigger};
    public ActivationType activationType;
    public Collider trigger;

    public enum PlatformType { oneTimeMove, PingPong, oneTimePlayer, oneTimePlayerWithReturn, 
        EndAndBackPlayer};
    public PlatformType platformType;

    public float startDelay;
    public float waypointWaitTime;
    private bool canMove = false;

    [Range(0,4.5f)]
    public float TranslationSpeed = 1;
    private float minDist2DestReached = .05f;
    //public float rotationSpeed = 30f;



    private Vector3 _originalPosition;
    private Quaternion _originalRotation;
    private Waypoint _originalWaypoint;
    private bool resetNow;

    private bool destinationReached;
    private bool isInWaypointWaitTime = false;
    //private bool shouldUpdateDestination = false;
    private bool hasReachedEnd;
    private bool movingForward;
    private bool activated;

    //public bool ActivatePlatform = false;

    public void resetPlatform()
    {
        resetNow = true;
        //reset of position and rotation is happening in the move function (otherwise it wont work)
            
        currentWaypoint = _originalWaypoint;
        setDestination(currentWaypoint.getPosition());
        resetNow = false;
        hasReachedEnd = false;
        movingForward = true;
        activated = false;
        isInWaypointWaitTime = false;
        trigger.gameObject.SetActive(true);
    }
    private void Start()
    {
        _originalPosition = Mover.Rigidbody.position;
        _originalRotation = Mover.Rigidbody.rotation;
        _originalWaypoint = currentWaypoint;

        resetPlatform();
        setDestination(currentWaypoint.transform.position);

        Mover.MoverController = this;
        if(activationType == ActivationType.none)
            activatePlatform();
        //activation type trigger is handeled by sendmessageupwards from the trigger
        //activation type player is handled by the kinematic controller in OnMovementHit()
    }

    public void UpdateMovement(out Vector3 goalPosition, out Quaternion goalRotation, float deltatime)
    {
        goalPosition = Mover.Rigidbody.position;
        goalRotation = Mover.Rigidbody.rotation;

        if(activated)
            updateOneTimeMove(out goalPosition, out goalRotation, deltatime);
        

        //Resetting the position and rotation cause it's necessarry to do here.
        if (resetNow)
        {
            //reset position and rotation
            goalPosition = _originalPosition;
            goalRotation = _originalRotation;

            //end reset
            resetNow = false;
        }
    }

    void updateOneTimeMove(out Vector3 goalPosition, out Quaternion goalRotation, float deltatime)
    {
        goalPosition = Mover.Rigidbody.position;
        goalRotation = Mover.Rigidbody.rotation;

        Vector3 destinationDirection = _destination - Mover.Rigidbody.position;
        float destinationDistance = destinationDirection.magnitude;
        //Debug.Log("dist to destination: " + destinationDistance);
        if (destinationDistance >= minDist2DestReached)
        {

            //do some rotation if necessarry
            goalRotation = Mover.Rigidbody.rotation;
            goalPosition = destinationDirection.normalized * TranslationSpeed * Time.deltaTime + Mover.Rigidbody.position;  
        }
        else
        {
            destinationReached = true;
            goalPosition = Mover.Rigidbody.position;
            goalRotation = Mover.Rigidbody.rotation;
            if(destinationReached)
                updateDestination();
        }
    }

    void updateDestination()
    {
        Debug.Log("Updating destination");
        switch (platformType)
        {
            case PlatformType.oneTimeMove:
                if (currentWaypoint.nextWaypoint != null)
                {
                    if(!isInWaypointWaitTime) //update destination
                    {
                        currentWaypoint = currentWaypoint.nextWaypoint;
                        
                        StartCoroutine(waitAtWaypoint(waypointWaitTime));
                    }

                }
                else
                {
                    hasReachedEnd = true;
                    //nothing happens
                }
                break;
            case PlatformType.PingPong:
                if (hasReachedEnd)
                {
                    if(currentWaypoint.previousWaypoint != null)
                    {
                        if (!isInWaypointWaitTime) //update destination
                        {
                            Debug.Log("tHIS IS ONLY CALLED ONCE PLZ");
                            currentWaypoint = currentWaypoint.previousWaypoint;
                            StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                    }
                    else
                    {
                        hasReachedEnd = false;
                    }
                }
                else
                {
                    if (currentWaypoint.nextWaypoint != null)
                    {
                        if (!isInWaypointWaitTime) //update destination
                        {
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                    }
                    else
                    {
                        hasReachedEnd = true;
                    }
                }
                break;
            case PlatformType.oneTimePlayerWithReturn:
                if (hasReachedEnd && activated)
                {
                    if (currentWaypoint.previousWaypoint != null)
                    {
                        if (!isInWaypointWaitTime) //update destination
                        {
                            currentWaypoint = currentWaypoint.previousWaypoint;
                            StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                    }
                    else
                    {
                        hasReachedEnd = false;
                        deactivatePlatform();
                    }
                }
                else if(!hasReachedEnd && activated)
                {
                    if (currentWaypoint.nextWaypoint != null)
                    {
                        if (!isInWaypointWaitTime) //update destination
                        {
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                    }
                    else
                    {
                        hasReachedEnd = true;
                        deactivatePlatform();
                    }
                }
                break;
            case PlatformType.EndAndBackPlayer:
                if (activated)
                {
                    if(movingForward) 
                    {
                        if(currentWaypoint.nextWaypoint != null)
                        {
                            if (!isInWaypointWaitTime) //update destination
                            {
                                currentWaypoint = currentWaypoint.nextWaypoint;
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
                            }
                        }
                        else
                        {
                            movingForward = false;
                        }
                    }
                    else
                    {
                        if(currentWaypoint.previousWaypoint != null)
                        {
                            if (!isInWaypointWaitTime) //update destination
                            {
                                currentWaypoint = currentWaypoint.previousWaypoint;
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
                            }
                        }
                        else
                        {
                            deactivatePlatform();
                            movingForward = true;
                        }
                    }
                }
                break;
            default:
                if (activated)
                {
                    if (currentWaypoint.nextWaypoint != null)
                    {
                        if (!isInWaypointWaitTime) //update destination
                        {
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                    }
                    else
                    {
                        hasReachedEnd = true;
                        deactivatePlatform();
                        //nothing happens
                    }
                }
                break;

        }
            
    }
    void setDestination(Vector3 destination)
    {
        this._destination = destination;
        //reachedDestination = false; 
    }
    public void activatePlatform()
    {
        if (activated)
            return; //don't start the delayed activate if the platform is already activated
                    //call this function in character controller in OnMovementHit() if it is indeed a moving platform
        Invoke("delayedActivatePlatform", startDelay);
        Debug.Log("Platform was activated!");
    }
    private void deactivatePlatform()
    {
        activated = false;
        canMove = false;
    }
    private void delayedActivatePlatform()
    {
        activated = true;
        canMove = true;
    }

    IEnumerator waitAtWaypoint(float waitTime)
    {
        canMove = false;
        isInWaypointWaitTime = true;
        yield return new WaitForSeconds(waitTime);

        setDestination(currentWaypoint.getPosition());
        destinationReached = false;
        isInWaypointWaitTime = false;
        canMove = true;
        //StartCoroutine(haveUpdatedDestination());
    }

    IEnumerator haveUpdatedDestination()
    {
        yield return new WaitForSeconds(.2f);
        //shouldUpdateDestination = false;
    }
}

