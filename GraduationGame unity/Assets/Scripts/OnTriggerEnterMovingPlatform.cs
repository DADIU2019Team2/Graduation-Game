using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OnTriggerEnterMovingPlatform : MonoBehaviour
{
    [SerializeField]private MovingPlatform relatedPlatform;
    private void OnTriggerEnter(Collider other)
    {
        if (relatedPlatform.activationLayers.Contains(other.gameObject.layer))
        {
            SendMessageUpwards("activatePlatform", null, SendMessageOptions.RequireReceiver);
            Debug.Log("The active state of: " + gameObject.name + " = " + gameObject.activeSelf);
            gameObject.SetActive(false);
        }
    }

}
