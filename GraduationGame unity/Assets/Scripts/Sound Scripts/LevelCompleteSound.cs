using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelCompleteSound : MonoBehaviour
{

private bool IsInCollider = false;
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }

  
  private void OnTriggerEnter (Collider other)
  {
      if (other.tag != "Player" || IsInCollider) { return; }
      AkSoundEngine.SetState("Zones", "Level_Complete");
      AkSoundEngine.PostEvent("Level_Complete", gameObject);
  }

}
