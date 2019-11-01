using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Waypoint : MonoBehaviour
{
    public Waypoint previousWaypoint;
    public Waypoint nextWaypoint;

    [Range(0, 5)]
    public float width = 0.3f;

    public Vector3 getPosition()
    {
        Vector3 minbound = transform.position + transform.right * width / 2f;
        Vector3 maxBound = transform.position - transform.right * width / 2f;

        return Vector3.Lerp(minbound, maxBound, Random.Range(0, 1));
    }
}
