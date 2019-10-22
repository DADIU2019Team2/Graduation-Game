using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckWallBetweenAudioAndListener : MonoBehaviour
{

    public static (bool isObstructed, float distance) CheckCollision(GameObject source)
    {
        RaycastHit hit;
        bool obstructed = Physics.Linecast(source.transform.position, GameObject.FindObjectOfType<AudioListener>().gameObject.transform.position, out hit);
        if (obstructed)
        {

            //Debug.Log("Object Intersecting, distance to object = " + hit.distance + " units");
            return (obstructed, hit.distance);
        }
        else
        {
            return (obstructed, float.MaxValue);
        }

    }

}
