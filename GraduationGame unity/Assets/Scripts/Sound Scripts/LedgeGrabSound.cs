using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LedgeGrabSound : MonoBehaviour
{

private bool IsInCollider = false;
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }

  
  private void OnTriggerEnter (Collider other)
  {
      if (other.tag != "Player" || IsInCollider) { return; }
      AkSoundEngine.PostEvent("Grabs", gameObject);
  }

}
