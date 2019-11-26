using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveAroundOBJ : MonoBehaviour
{
    public enum MoveDirection { Clockwise, CounterClockwise};
    public MoveDirection moveDir;

    public enum MoveBase { currentPosition, offset};
    public MoveBase baseForMovement;

    public GameObject objToMoveAround;

    public float SpeedOfOrbit;

    private void Start()
    {
        
    }
    void Update()
    {
        moveAroundOBJ(objToMoveAround.transform);
    }

    void moveAroundOBJ(Transform objToMoveAround)
    {
        if (moveDir.Equals(MoveDirection.CounterClockwise))
        {
            //SpeedOfOrbit = SpeedOfOrbit * -1;
            transform.RotateAround(objToMoveAround.position, objToMoveAround.up, -SpeedOfOrbit * Time.deltaTime);
        }
        if (moveDir.Equals(MoveDirection.Clockwise))
        {
            //SpeedOfOrbit = SpeedOfOrbit * -1;
            transform.RotateAround(objToMoveAround.position, objToMoveAround.up, SpeedOfOrbit * Time.deltaTime);

        }
    }
}
