using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DickSwitchRequest : MonoBehaviour
{
    private Collider trigger;

    public Material easterEggMaterial;
    public string tagToCheckFor = "Player";

    private void Start()
    {
        trigger = GetComponent<Collider>();
        if(trigger == null)
        {
            Debug.LogError(gameObject.name + " has no collider");
            return;
        }
        trigger.isTrigger = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(tagToCheckFor))
        {
            if (easterEggMaterial.HasProperty("_switchPicture"))
            {
                float initialState = easterEggMaterial.GetFloat("_switchPicture");
                easterEggMaterial.SetFloat("_switchPicture", 1);
            }
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag(tagToCheckFor))
        {
            if (easterEggMaterial.HasProperty("_switchPicture"))
            {
                float initialState = easterEggMaterial.GetFloat("_switchPicture");
                easterEggMaterial.SetFloat("_switchPicture", 0);
            }
        }
    }
}
