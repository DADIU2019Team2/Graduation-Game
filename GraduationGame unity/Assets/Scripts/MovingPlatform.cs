using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace KinematicCharacterController.Examples
{
    public class MovingPlatform : MonoBehaviour, IMoverController
    {
        public PhysicsMover Mover;

        public Waypoint currentWaypoint;
        private Vector3 _destination;
        
        public enum PlatformType { oneTimeMove, PingPong, oneTimePlayer, oneTimePlayerWithReturn, 
            EndAndBackPlayer};
        public PlatformType platformType;

        public float startDelay;
        public float waypointWaitTime;
        private bool isInWaypointWaitTime = false;

        [Range(0,4.5f)]
        public float TranslationSpeed = 1;
        private float minDist2DestReached = .05f;
        //public float rotationSpeed = 30f;



        private Vector3 _originalPosition;
        private Quaternion _originalRotation;
        private Waypoint _originalWaypoint;
        private bool resetNow;

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
        }
        private void Start()
        {
            _originalPosition = Mover.Rigidbody.position;
            _originalRotation = Mover.Rigidbody.rotation;
            _originalWaypoint = currentWaypoint;

            resetPlatform();
            setDestination(currentWaypoint.transform.position);

            Mover.MoverController = this;
        }

        public void UpdateMovement(out Vector3 goalPosition, out Quaternion goalRotation, float deltatime)
        {
            goalPosition = Mover.Rigidbody.position;
            goalRotation = Mover.Rigidbody.rotation;
            /*if (ActivatePlatform)
            {
                activatePlatform();
                ActivatePlatform = false;
            }*/
            if (platformType == PlatformType.oneTimeMove)
            {
                updateOneTimeMove(out goalPosition, out goalRotation, deltatime);
            }
            if(platformType == PlatformType.PingPong)
            {
                updateOneTimeMove(out goalPosition, out goalRotation, deltatime);
            }
            if(platformType == PlatformType.oneTimePlayer)
            {
                if (activated)
                {
                    updateOneTimeMove(out goalPosition, out goalRotation, deltatime);
                }
            }
            if(platformType == PlatformType.oneTimePlayerWithReturn)
            {
                if (activated)
                {
                    updateOneTimeMove(out goalPosition, out goalRotation, deltatime);
                }
            }
            if(platformType == PlatformType.EndAndBackPlayer)
            {
                if (activated)
                {
                    updateOneTimeMove(out goalPosition, out goalRotation, deltatime);
                }
            }

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
            if (destinationDistance >= minDist2DestReached)
            {
                //do some rotation if necessarry
                goalRotation = Mover.Rigidbody.rotation;
                goalPosition = destinationDirection.normalized * TranslationSpeed * Time.deltaTime + Mover.Rigidbody.position;  
            }
            else
            {
                goalPosition = Mover.Rigidbody.position;
                goalRotation = Mover.Rigidbody.rotation;
                updateDestination();
            }
        }

        void updateDestination()
        {
            switch (platformType)
            {
                case PlatformType.oneTimeMove:
                    if (currentWaypoint.nextWaypoint != null)
                    {
                        currentWaypoint = currentWaypoint.nextWaypoint;
                        
                        if(!isInWaypointWaitTime) //update destination
                            StartCoroutine(waitAtWaypoint(waypointWaitTime));

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
                            currentWaypoint = currentWaypoint.previousWaypoint;
                            if (!isInWaypointWaitTime) //update destination
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
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
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            if (!isInWaypointWaitTime) //update destination
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
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
                            currentWaypoint = currentWaypoint.previousWaypoint;
                            if (!isInWaypointWaitTime) //update destination
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                        else
                        {
                            hasReachedEnd = false;
                            activated = false;
                        }
                    }
                    else if(!hasReachedEnd && activated)
                    {
                        if (currentWaypoint.nextWaypoint != null)
                        {
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            if (!isInWaypointWaitTime) //update destination
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                        else
                        {
                            hasReachedEnd = true;
                            activated = false;
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
                                currentWaypoint = currentWaypoint.nextWaypoint;
                                if (!isInWaypointWaitTime) //update destination
                                    StartCoroutine(waitAtWaypoint(waypointWaitTime));
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
                                currentWaypoint = currentWaypoint.previousWaypoint;
                                if (!isInWaypointWaitTime) //update destination
                                    StartCoroutine(waitAtWaypoint(waypointWaitTime));
                            }
                            else
                            {
                                activated = false;
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
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            if (!isInWaypointWaitTime) //update destination
                                StartCoroutine(waitAtWaypoint(waypointWaitTime));
                        }
                        else
                        {
                            hasReachedEnd = true;
                            activated = false;
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
        }
        private void delayedActivatePlatform()
        {
            activated = true;
        }

        IEnumerator waitAtWaypoint(float waitTime)
        {
            //Debug.Log("I am in Wait At Waypoint!!!");
            //Debug.Log("Time since start = " + Time.realtimeSinceStartup);

            isInWaypointWaitTime = true;
            yield return new WaitForSeconds(waitTime);
            setDestination(currentWaypoint.getPosition());
            //Debug.Log("Time since start = " + Time.realtimeSinceStartup);
            StartCoroutine(isInWAypointWaitTime());
        }

        IEnumerator isInWAypointWaitTime()
        {
            yield return new WaitForSeconds(0f);
            isInWaypointWaitTime = false;
        }
    }
}
