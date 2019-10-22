using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class LocalizationManager : MonoBehaviour
{

    public static Dictionary<string, string> dictionary;
    public enum GameLanguage { Key = 0, English = 2, Danish = 1 };
    private int languageID;
    public GameLanguage gameLanguage;
    public TextAsset csvTranslation;
    //private string languageFolder = "Assets/Resources/Localization/"; // if we want to use the resource folder instead
    //public TextAsset[] translationFiles;
    string[] csvLanguage;

    void Awake()
    {
        languageID = (int)gameLanguage;
        dictionary = new Dictionary<string, string>();
        csvLanguage = csvTranslation.text.Split('\n');
        LoadLangageCSVFile(gameLanguage);
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            ChangeLanguage(gameLanguage);
        }
    }

    void LoadLangageCSVFile(GameLanguage language)
    {
        dictionary.Clear();
        foreach (string s in csvLanguage)
        {
            if (s.Length > 1)
            {
                //Debug.Log(s.Length);
                //Debug.Log(s);
                string[] line = s.Split(';');
                //Debug.Log(line[(int)language]);
                //Debug.Log("key: " + line[0] + "=" + line[(int)language]);
                string key = line[0];
                string value = line[(int)language];
                dictionary.Add(key, value);

            }

            //string key = line[0].Trim().Trim(';');
            //string value = line[1].Trim().Trim(';');
            //dictionary.Add(key, value);
            //Debug.Log(key + " = " + value);
        }
        AutoTranslator[] autos2 = Resources.FindObjectsOfTypeAll<AutoTranslator>();
        foreach (AutoTranslator a in autos2)
            a.OnLanguageChange();
        //foreach (string k in dictionary.Keys)
            //Debug.Log(k + " is " + dictionary[k]);
    }

    void ChangeLanguage(GameLanguage language)
    {
        gameLanguage = language;
        languageID = (int)gameLanguage;

        LoadLangageCSVFile(gameLanguage);
        AutoTranslator[] autos = Resources.FindObjectsOfTypeAll<AutoTranslator>();
        foreach (AutoTranslator a in autos)
            a.OnLanguageChange();
    }
    public void ButtonChangeLanguage(string language)
    {
        ChangeLanguage((GameLanguage)System.Enum.Parse(typeof(GameLanguage), language));
    }

    public static string TranslateKey(string key)
    {
        if (dictionary ==null)
        {
            Debug.Log("No Dictionary");

        }
        if (dictionary.ContainsKey(key) == false)
            return key;
        else
        {
            return dictionary[key];
        }
    }
}
