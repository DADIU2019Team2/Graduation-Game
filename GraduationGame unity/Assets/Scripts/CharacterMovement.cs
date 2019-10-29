﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class CharacterMovement : MonoBehaviour
{
    //scriptable object for settings
    public PlayerControllerSettings settings;
    float velocity;
    public static bool facingRight = true;
    //get from scriptable object
    float rampUpTime; //how long to reach max point in curve
    float rampDownTime;
    float maxSpeed; 
    AnimationCurve rampUpCurve; //speed curve
    AnimationCurve rampDownCurve;
    CharacterController controller;
    Vector3 movement;
    bool stopped = false;
    float curveStep;
    int direction = 1;
    bool rampingDown = false;

    float jumpHeight;
    float gravity;
    public float jumpPower;
    float verticalpower = 0;
    bool isGrounded;
    public LayerMask grounLayers;
    Transform groundedTransform;
    [SerializeField]
    float groundedDistance;
    
    enum movementTypes
    {
        jump,
        changeDirection,
        stop,
    }
    enum movementState
    {
        running,
        walking,
        sliding,
    }

    void Init()
    {
        rampUpTime = settings.rampUpTime;
        rampDownTime = settings.rampDownTime;
        maxSpeed = settings.maxSpeed;
        rampUpCurve = settings.rampUpCurve;
        rampDownCurve = settings.rampDownCurve;
        gravity = settings.gravity;
        jumpHeight = settings.jumpHeight;
        groundedDistance = settings.groundedDistance;
        groundedTransform = settings.groundedTransform;
    }
    // Start is called before the first frame update
    void Start()
    {
        Init();
        controller = this.GetComponent<CharacterController>();
        movement = new Vector3(1, 1, 0);
        
    }

    // Update is called once per frame
    void Update()
    {
        //isGrounded = Physics.OverlapSphere();
        if (Input.GetKeyDown(KeyCode.W))
        {
            MovePlayer(movementTypes.changeDirection);
        }
        else if (Input.GetKeyDown(KeyCode.S))
        {
            MovePlayer(movementTypes.stop);
        }
        else if (Input.GetKeyDown(KeyCode.Space))
        {
            MovePlayer(movementTypes.jump);
        }
        if (rampingDown)
        {
            if (curveStep < 1)
            {
                curveStep += (1 / rampDownTime * Time.deltaTime);
            }
            if (curveStep >= 1)
            {
                curveStep = 0;
                rampingDown = false;
                direction = direction * -1;
            }
        }
        else
        {
            if (curveStep < 1)
            {
                curveStep += (1 / rampUpTime * Time.deltaTime);
            }
            if (curveStep > 1)
            {
                curveStep = 1;
            }
        }
        if (!stopped)
        {
            if (rampingDown)
            {
                velocity = maxSpeed * rampDownCurve.Evaluate(curveStep);
            }
            else
            {
                velocity= maxSpeed*rampUpCurve.Evaluate(curveStep);
            }
        }
        movement.y -= (gravity * Time.deltaTime) - (verticalpower * Time.deltaTime);
        if (verticalpower > 0)
        {
            verticalpower -= gravity * Time.deltaTime;
        }
        if (verticalpower < 0)
        {
            verticalpower = 0;
        }
        Debug.Log(movement.y);
        controller.Move(new Vector3((direction * velocity *movement.x)*Time.deltaTime, movement.y*Time.deltaTime,0));
    }
    
    void MovePlayer(movementTypes input)
    {
        if (input == movementTypes.changeDirection)
        {
            if (stopped)
            {
                stopped = false;
                rampingDown = false;
                curveStep = 0;
                
            }
            else
            {
                curveStep = 1 - curveStep;
                rampingDown = true;
            }
            
            facingRight = !facingRight;
        }
        if (input == movementTypes.stop)
        {

            velocity = 0;
            stopped = true;
            curveStep = 0;
        }
        if (input == movementTypes.jump)
        {
            Debug.Log("Jump");
            movement.y = 0;
            verticalpower = jumpPower;
        }


    }
    public static bool GetIsFacingRight()
    {
        return facingRight;
    }
    public Vector3 GetVector()
    {
        return controller.velocity;
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "wall")
        {
            MovePlayer(movementTypes.stop);
        }
    }
}
