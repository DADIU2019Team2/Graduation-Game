using System;
using UnityEngine;
using System.Linq;
using TMPro;
using UnityEditor;

public class ReadBuildNumber : MonoBehaviour
{
    void Start()
    {
        if (GetComponent<TextMeshProUGUI>() != null)
        {
            TextMeshProUGUI textElement = GetComponent<TextMeshProUGUI>();
            textElement.text = readBuildNRFile();
        }
    }

    string readBuildNRFile()
    {
        /*string buildNumFilePath = Application.dataPath + "/buildNumbers.txt";
        string[] everyLine = File.ReadAllLines(buildNumFilePath);*/

        TextAsset buildNRFile = Resources.Load("buildNumbers") as TextAsset;
        if (buildNRFile == null) {return "Build #null"; }
        string allLines = buildNRFile.text;
        string[] everyLine = new string[3];
        if (allLines.Count<Char>() > 0)
        {
            everyLine = allLines.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
        }

        if (everyLine.Length > 0)
        {
            return everyLine[2] + " Build NR: " + everyLine[1];//the number should be in the second line always
        }
        return "There is no build number to be found";
    }
}
