#if UNITY_EDITOR
using UnityEditor;
using System.IO;
using System.Linq;

public class SaveGameEditor
{
    [MenuItem("Tools/GenerateEnum")]
    public static void Go()
    {
        string enumName = "Unlockables";
        string[] enumEntries = GameSave.currentSave.unlockables.Keys.ToArray();
        string filePathAndName = "Assets/Scripts/Enums/" + enumName + ".cs"; //The folder Scripts/Enums/ is expected to exist

        using (StreamWriter streamWriter = new StreamWriter(filePathAndName))
        {
            streamWriter.WriteLine("public enum " + enumName);
            streamWriter.WriteLine("{");
            for (int i = 0; i < enumEntries.Length; i++)
            {
                streamWriter.WriteLine("\t" + enumEntries[i] + ",");
            }
            streamWriter.WriteLine("}");
        }
        AssetDatabase.Refresh();
    }
}
#endif