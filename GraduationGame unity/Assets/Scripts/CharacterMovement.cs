using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class CharacterMovement : MonoBehaviour
{
    //public float acceleration;
    float velocity;
    bool facingRight = true;
    public float rampUpSpeed;
    public float rampDownSpeed;
    public float maxSpeed;

    CharacterController controller;
    Vector3 movement;
    bool stopped = false;
    float curveStep;
    int direction = 1;
    bool rampingDown = false;

    public AnimationCurve rampUpCurve;
    public AnimationCurve rampDownCurve;
    enum movementTypes
    {
        jump,
        changeDirection,
        stop,
    }

    // Start is called before the first frame update
    void Start()
    {
        controller = this.GetComponent<CharacterController>();
        movement = new Vector3(1, 0, 0);
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
        if (rampingDown)
        {
            if (curveStep < 1)
            {
                curveStep += (1 / rampDownSpeed * Time.deltaTime);
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
                curveStep += (1 / rampUpSpeed * Time.deltaTime);
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

        controller.Move((direction * velocity *movement)*Time.deltaTime);
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
