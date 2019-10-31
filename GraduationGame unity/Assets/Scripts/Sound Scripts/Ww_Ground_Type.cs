using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CapsuleCollider))]

public class Ww_ : MonoBehaviour
{
  public string SwitchGroup = "Footstep_Type";
  public string Switch = "Metal";
  public string ExitSwitch = "Normal";
  public GameObject Character;
  public bool Debug_Enabled;

  private void OnTriggerEnter(Collider other)
  {
      if (other.tag != "Player") { return; }
      if (Debug_Enabled) { Debug.Log(Switch + "Switch set"); }
      AkSoundEngine.SetSwitch(SwitchGroup, Switch, Character);
  }
  private void OnTriggerExit(Collider other)
  {
    if (other.tag != "Player") { return; }
    if (Debug_Enabled) { Debug.Log(ExitSwitch + "Switch set"); }
    AkSoundEngine.SetSwitch(SwitchGroup, ExitSwitch, Character);
  }
}

