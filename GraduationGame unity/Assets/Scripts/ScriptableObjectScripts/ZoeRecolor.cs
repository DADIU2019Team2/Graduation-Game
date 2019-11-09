using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Zoe Recolor", menuName = "ScriptableObject/Player/Zoe Recolor")]
public class ZoeRecolor : ScriptableObject
{
    public Material zoeHeadMaterial;
    public Material zoeOutfitMaterial;
    public Material zoeBodyMaterial;
    
    public Material[] smth; //Get shader-node color attribute for Zoe-Scarf.

    
}
