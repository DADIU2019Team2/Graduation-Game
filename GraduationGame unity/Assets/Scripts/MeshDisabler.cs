using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeshDisabler : MonoBehaviour, IOnSceneReset
{
    public GameObject mesh;
    public GameObject scarf;
    // Start is called before the first frame update
    public void OnDeathDisable()
    {
        mesh.SetActive(false);
        scarf.SetActive(false);
    }

    public void OnResetLevel()
    {
        mesh.SetActive(true);
        scarf.SetActive(true);
    }
}
