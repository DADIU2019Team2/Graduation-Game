using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckpointManager : MonoBehaviour
{
    [SerializeField] private Transform currentCheckpoint;

    void SetCurrentCheckpoint(Transform checkpoint)
    {
        currentCheckpoint = checkpoint;
    }
}
