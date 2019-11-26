using System.Collections;
using System.Collections.Generic;
using MiniGame2.Events;
using UnityEngine;

public class CheckpointManager : MonoBehaviour
{
    private static Transform myCurrentCheckpoint;
    private static Vector3 currentCheckpointPos;
    [SerializeField] private SaveTransform ourCurrentCheckpoint;
    public VoidEvent resetHealthEvent;

    public VoidEvent respawnFacingLeftEvent, respawnFacingRightEvent;

    void SetCurrentCheckpoint(Transform checkpoint)
    {
        Debug.Log("Checkpoint type = " + checkpoint.GetType());
        myCurrentCheckpoint = checkpoint;
        //Transform checkpointToSave = checkpoint;
        //ourCurrentCheckpoint.SetTransformToSave(checkpointToSave);
        ourCurrentCheckpoint.SetPosToSave(checkpoint);
        currentCheckpointPos = myCurrentCheckpoint.position;
        resetHealthEvent.Raise();


    }

    public static Vector3 GetCurerntCheckpoint()
    {
        if (myCurrentCheckpoint == null) return Vector3.zero;
        return myCurrentCheckpoint.position;
    }


}
