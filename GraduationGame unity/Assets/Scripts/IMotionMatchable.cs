using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class MotionMatchable : MonoBehaviour
{
    public abstract TrajectoryInfo PredictTrajectory();
}
