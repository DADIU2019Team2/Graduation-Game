using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class foog : MonoBehaviour
{
    public Vector3[] positions;

    public GameObject[] predictionPoints;
    Vector3[] predictionPointPos;
    // Start is called before the first frame update
    void Update()
    {
        predictionPointPos = new Vector3[predictionPoints.Length];
        for (int i = 0; i < predictionPointPos.Length; i++)
        {
            predictionPointPos[i] = predictionPoints[i].transform.position;
        }
        //Debug.Log(CapsuleCast.PredictColissionMultiplePoints(positions));

        Debug.Log(CapsuleCast.PredictColissionMultiplePoints(predictionPointPos));
        if (CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).isPathClear == false)
        {
            Vector3 offSet = CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).normalOfCollision * CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).distanceFromCollisionToEnd;
            offSet = new Vector3(offSet.x, 0,offSet.z);
            predictionPoints[CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).arrayIndexOfCollision + 1].transform.position +=  offSet;
        }
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).isPathClear == false)
            {
                
                predictionPoints[CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).arrayIndexOfCollision + 1].transform.position += CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).normalOfCollision * CapsuleCast.PredictColissionMultiplePoints(predictionPointPos).distanceFromCollisionToEnd;
            }
        }
    }

  
}
