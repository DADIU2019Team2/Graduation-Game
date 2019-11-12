using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LedgeGrabPoint : MonoBehaviour
{
    [Tooltip("The point relative to the collider where zoe should be placed on grab")]
    public Vector3 offset;
    public enum ZoeShouldBeFacing
    {
        Right = 1,
        Left = -1
    }
    public ZoeShouldBeFacing zoeShouldBeFacing;

    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawSphere(gameObject.transform.position+offset+Vector3.up, 0.1f);
    }
}
