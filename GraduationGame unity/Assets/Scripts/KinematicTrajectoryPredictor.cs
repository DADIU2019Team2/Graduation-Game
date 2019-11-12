using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KinematicTrajectoryPredictor : MotionMatchable
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public override TrajectoryInfo PredictTrajectory()
    {
        return new TrajectoryInfo(new Vector3[0], new Vector3[0] );
    }
}
