using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class CharacterMovement : MonoBehaviour
{
    //public float acceleration;
    public PlayerControllerSettings settings;
    float velocity;
    bool facingRight = true;
    //get from scriptable object
    float rampUpTime;
    float rampDownTime;
    float maxSpeed;
    AnimationCurve rampUpCurve;
    AnimationCurve rampDownCurve;
    CharacterController controller;
    Vector3 movement;
    bool stopped = false;
    float curveStep;
    int direction = 1;
    bool rampingDown = false;

   
    public float gravity;
    public float jumpPower;
    float verticalpower = 0;
    
    enum movementTypes
    {
        jump,
        changeDirection,
        stop,
    }

    void Init()
    {
        rampUpTime = settings.rampUpTime;
        rampDownTime = settings.rampDownTime;
        maxSpeed = settings.maxSpeed;
        rampUpCurve = settings.rampUpCurve;
        rampDownCurve = settings.rampDownCurve;
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
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "wall")
        {
            MovePlayer(movementTypes.stop);
        }
    }
}
