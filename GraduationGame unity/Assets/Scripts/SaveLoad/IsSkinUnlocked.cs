using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class IsSkinUnlocked : MonoBehaviour
{

    public Unlockables skin;
    // Start is called before the first frame update
    void Start()
    {
        IsSkinUnlockedOnLoad(skin);
    }

    void IsSkinUnlockedOnLoad(Unlockables skins)
    {
        if (GameSave.currentSave.GetUnlocks(skins))
        {
            gameObject.GetComponent<Button>().interactable = true;
        }
        else
        {
            gameObject.GetComponent<Button>().interactable = false;
        }
        
    }


}
