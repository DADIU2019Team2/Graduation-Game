using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkinSwapper : MonoBehaviour
{
    public SkinnedMeshRenderer[] headMaterialRenderers, outfitMaterialRenderers, bodyMaterialRenderers;


    public SkinnedMeshRenderer scarfMat;
    public ParticleSystem scarfParticleMat;


    public PlayerStats playerStats;

    private void Start()
    {
        //SetSkinFromMainMenu(playerStats.selectedSkin);
    }

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
            foreach (SkinnedMeshRenderer mRend in headMaterialRenderers)
            {
                ChangeMaterialInRenderer(mRend, recolor.zoeHeadMaterial);
            }
            foreach (SkinnedMeshRenderer mRend in bodyMaterialRenderers)
            {
                ChangeMaterialInRenderer(mRend, recolor.zoeBodyMaterial);
            }
            foreach (SkinnedMeshRenderer mRend in outfitMaterialRenderers)
            {
                ChangeMaterialInRenderer(mRend, recolor.zoeOutfitMaterial);
            }
            //scarfMat.material.SetColor("_colourAttr", recolor.scarfColor);
            //scarfParticleMat.GetComponent<ParticleSystemRenderer>().material.SetColor("_colourAttr", recolor.scarfParticleColor);
            Debug.Log("Changed skin to skin #" + skinIndex);
        }
    }

    public void SetSkinFromMainMenu(int skinIndex)
    {
        playerStats.selectedSkin = skinIndex;
        playerStats.SetCurrentZoeRecolor(skinIndex);
        GameSave.currentSave.skinIndexUsed = skinIndex;
        SaveLoad.Save();
    }

    private void ChangeMaterialInRenderer(SkinnedMeshRenderer meshRenderer, Material material)
    {
        meshRenderer.material = material;
    }
}
