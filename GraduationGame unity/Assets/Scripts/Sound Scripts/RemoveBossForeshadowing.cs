using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RemoveBossForeshadowing : MonoBehaviour
{

private bool IsInCollider = false;
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
private void OnTriggerEnter (Collider other)
{
    if (other.tag != "Player" || IsInCollider) { return; }
    AkSoundEngine.SetRTPCValue("Boss_Foreshadowing", 0);
}

}
