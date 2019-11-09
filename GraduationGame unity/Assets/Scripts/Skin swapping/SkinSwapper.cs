using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkinSwapper : MonoBehaviour
{
    public MeshRenderer[] headMaterialRenderers, outfitMaterialRenderers, bodyMaterialRenderers;

    public SkinnedMeshRenderer scarfMat;
    public ParticleSystem scarfParticleMat;

    public PlayerStats playerStats;


    public void SwapSkins(int skinIndex)
    {
        if (skinIndex >= playerStats.allZoeRecolors.Length || skinIndex < 0)
        {
            Debug.Log("Tried selecting a skin that was out of bounds in the 'allZoeRecolors'-array, skinIndex was: " + skinIndex);
            return;
        }
        else
        {
            ZoeRecolor recolor = playerStats.allZoeRecolors[skinIndex];
            foreach (MeshRenderer mRend in headMaterialRenderers)
            {
                ChangeMaterialInRenderer(mRend, recolor.zoeHeadMaterial);
            }
            foreach (MeshRenderer mRend in bodyMaterialRenderers)
            {
                ChangeMaterialInRenderer(mRend, recolor.zoeBodyMaterial);
            }
            foreach (MeshRenderer mRend in outfitMaterialRenderers)
            {
                ChangeMaterialInRenderer(mRend, recolor.zoeOutfitMaterial);
            }
            scarfMat.material.SetColor("_colourAttr", recolor.scarfColor);
            scarfParticleMat.GetComponent<ParticleSystemRenderer>().material.SetColor("_colourAttr", recolor.scarfParticleColor);
            Debug.Log("Changed skin to skin #" + skinIndex);
        }
    }

    public void SetSkinFromMainMenu(int skinIndex)
    {
        playerStats.selectedSkin = skinIndex;
    }

    private void ChangeMaterialInRenderer(MeshRenderer meshRenderer, Material material)
    {
        meshRenderer.material = material;
    }
}
