using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]

public class TriggerHitSave : MonoBehaviour
{
    
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            //Debug.Log("Game Done");
            GameSave.GetGameSave().CompletedLevel();
            LoadScene.LoadNextScene();

        }
    }
}
