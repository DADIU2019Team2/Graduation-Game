using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class CapsuleCast : MonoBehaviour
{
   
    public static bool PredictColission(Vector3 position, Vector3 targetPosition)
    {
        Vector3 halfExtents = Vector3.one;

        Quaternion rotation = Quaternion.LookRotation(targetPosition - position);
        Vector3 direction = targetPosition - position;
        float distance = Vector3.Distance(position, targetPosition);
        RaycastHit[] rhit = Physics.BoxCastAll(position, halfExtents, direction, rotation, distance);
        //bool result = rhit.All(r => r.collider.tag != "Environment");
        bool result = rhit.Length <= 0;
        Debug.DrawLine(position, targetPosition, result ? Color.green : Color.red, 0.01f);
        return result;
    }

    public static (bool isPathClear, Vector3 normalOfCollision, Vector3 pointOfIntersection, float distanceToCollision,int arrayIndexOfCollision, float distanceFromCollisionToEnd) PredictColissionMultiplePoints(Vector3[] positions)
    {
        //return if there is an obstacle, then normal of the obstacle, the point of impact,
        float height = 1f;
        float radius = 0.2f;
        List<bool> results = new List<bool>();
        RaycastHit[] rhit;
        List<Vector3> normals = new List<Vector3>();
        List<Vector3> points = new List<Vector3>();
        List<float> distances = new List<float>();
        List<int> index = new List<int>();
        List<float> distanceTwo = new List<float>();
        for (int i = 0; i < positions.Length - 1; i++)
        {
            Quaternion rotation = Quaternion.LookRotation(positions[i + 1] - positions[i]);
            Vector3 direction = positions[i+1] - positions[i];
            float distance = Vector3.Distance(positions[i], positions[i+1]);
            rhit = Physics.CapsuleCastAll(positions[i]+new Vector3(0,radius,0), positions[i]+(Vector3.up)*height, radius, direction, distance);
            //bool result = rhit.All(r => r.collider.tag != "Environment");
            results.Add(rhit.Length <= 0);
            Debug.DrawLine(positions[i], positions[i+1], results[i] ? Color.green : Color.red, 0.01f);

            if (results[i] == false)
            {
                // return (false, rhit[0].normal, rhit[0].point);
                normals.Add(rhit[0].normal);
                points.Add(rhit[0].point);
                distances.Add(rhit[0].distance);
                index.Add(i);
                distanceTwo.Add(distance- rhit[0].distance);
            }
           
        }
        int j = 0;
        for (int i = 0; i < results.Count; i++)
        {
            if (results[i] == false)
            {
                if (distances[i-j] == 0)
                {
                    //Debug.Log("overlap found");
                }
                return (false, normals[i-j], points[i-j], distances[i-j], index[i-j], distanceTwo[i-j]);
            }
            else
            {
                j++;
            }
        }
        return (true, new Vector3(999, 999, 999), new Vector3(999,999,999),99999, 9999 , 9999);
    }
}
