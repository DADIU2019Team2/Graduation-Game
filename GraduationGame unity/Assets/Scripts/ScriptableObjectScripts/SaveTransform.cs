using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Save Tranform", menuName = "ScriptableObject/Save Transform")]
public class SaveTransform : ScriptableObject
{
    //[SerializeField] private Transform transformToSave;
    [SerializeField] private Vector3 posToSave;

    /*public void SetTransformToSave(Transform transform)
    {
        transformToSave = transform;
    }

    public Transform GetTransformToSave()
    {
        return transformToSave;
    }*/

    public void SetPosToSave(Transform trans)
    {
        posToSave = trans.position;
    }
    public Vector3 GetPosToSave()
    {
        return posToSave;
    }
}
