using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckpointManager : MonoBehaviour
{
    [SerializeField] private Transform myCurrentCheckpoint;
    [SerializeField] private SaveTransform ourCurrentCheckpoint;

    void SetCurrentCheckpoint(Transform checkpoint)
    {
        Debug.Log("Checkpoint type = " + checkpoint.GetType());
        myCurrentCheckpoint = checkpoint;
        //Transform checkpointToSave = checkpoint;
        //ourCurrentCheckpoint.SetTransformToSave(checkpointToSave);
        ourCurrentCheckpoint.SetPosToSave(checkpoint);
    }
}
