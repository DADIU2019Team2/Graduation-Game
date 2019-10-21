using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Damageble object", menuName = "ScriptableObject/Damageble object")]
public class DamagebleObject : ScriptableObject
{
    public int hp = 20;
    public int dmgTaken = 5;
    public string tagOfHarmfulObjects = "Write Tag here";
}
