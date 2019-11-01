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
            EndAndBackPlayer, FallingPlatformPlayer};
        public PlatformType platformType;

        public float delay;


        public float TranslationSpeed = 1;
        private float minDist2DestReached = .3f;
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
            //reset is happening in the move function (otherwise it wont work)
        }
        private void Start()
        {
            resetNow = false;
            hasReachedEnd = false;
            movingForward = true;
            activated = false;

            _originalPosition = Mover.Rigidbody.position;
            _originalRotation = Mover.Rigidbody.rotation;
            _originalWaypoint = currentWaypoint;


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
            if(platformType == PlatformType.FallingPlatformPlayer)
            {
                if (activated)
                {
                    updateDestination();
                    //dome some seperate logic on this...
                }
            }

            //reset needs to happen in this function
            if (resetNow)
            {
                goalPosition = _originalPosition;
                goalRotation = _originalRotation;
                currentWaypoint = _originalWaypoint;
                setDestination(currentWaypoint.getPosition());

                //end reset
                resetNow = false;
            }
        }

        void updateOneTimeMove(out Vector3 goalPosition, out Quaternion goalRotation, float deltatime)
        {
            goalPosition = Mover.Rigidbody.position;
            goalRotation = Mover.Rigidbody.rotation;
            if (Mover.Rigidbody.position != _destination)
            {
                Vector3 destinationDirection = _destination - Mover.Rigidbody.position;

                float destinationDistance = destinationDirection.magnitude;

                if (destinationDistance >= minDist2DestReached)
                {
                    //reachedDestination = false;

                    //do some rotation if necessarry
                    goalRotation = Mover.Rigidbody.rotation;

                    goalPosition = destinationDirection.normalized * TranslationSpeed * Time.deltaTime + Mover.Rigidbody.position;
                }
                else
                {
                    //reachedDestination = true;
                    goalPosition = Mover.Rigidbody.position;
                    goalRotation = Mover.Rigidbody.rotation;
                    updateDestination();
                }
            }
            else
            {
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
                        setDestination(currentWaypoint.getPosition());
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
                            setDestination(currentWaypoint.getPosition());
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
                            setDestination(currentWaypoint.getPosition());
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
                            setDestination(currentWaypoint.getPosition());
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
                            setDestination(currentWaypoint.getPosition());
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
                                setDestination(currentWaypoint.getPosition());
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
                                setDestination(currentWaypoint.getPosition());
                            }
                            else
                            {
                                activated = false;
                                movingForward = true;
                            }
                        }
                    }
                    break;
                case PlatformType.FallingPlatformPlayer:
                    Debug.LogWarning("Falling platforms is not implemented yet...");
                    break;
                default:
                    if (activated)
                    {
                        if (currentWaypoint.nextWaypoint != null)
                        {
                            currentWaypoint = currentWaypoint.nextWaypoint;
                            setDestination(currentWaypoint.getPosition());
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
            //call this function in character controller in OnMovementHit() if it is indeed a moving platform
            Invoke("delayedActivatePlatform", delay);
        }
        private void delayedActivatePlatform()
        {
            activated = true;
        }
    }
}