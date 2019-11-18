using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class UnlockItem
{

    public static void UnlockItems(Unlockables item)
    {
        GameSave.currentSave.UpdateUnlocks(item,true);
    }

}
