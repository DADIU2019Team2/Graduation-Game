using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckpointManager : MonoBehaviour
{
    private static Transform myCurrentCheckpoint;
    private static Vector3 currentCheckpointPos;
    [SerializeField] private SaveTransform ourCurrentCheckpoint;

    void SetCurrentCheckpoint(Transform checkpoint)
    {
        Debug.Log("Checkpoint type = " + checkpoint.GetType());
        myCurrentCheckpoint = checkpoint;
        //Transform checkpointToSave = checkpoint;
        //ourCurrentCheckpoint.SetTransformToSave(checkpointToSave);
        ourCurrentCheckpoint.SetPosToSave(checkpoint);
        currentCheckpointPos = myCurrentCheckpoint.position;
    }
    public static Vector3 GetCurerntCheckpoint()
    {
        return myCurrentCheckpoint.position;
    }
}
