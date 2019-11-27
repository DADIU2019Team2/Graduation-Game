using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New localizationSystem", menuName = "ScriptableObject/Localization/New localization system")]
public class Language : ScriptableObject
{
    //public string ShowCurrentLanguage; //only for show not actually used
    public enum LocalazationLanguage { Key = 0, English = 2, Dansk = 1 };
    [SerializeField] private LocalazationLanguage currentLanguage;

    public delegate void OnLangugeChangeDelegate(LocalazationLanguage lang);
    public event OnLangugeChangeDelegate languageChangeEvent;

    public void SetLanguage(LocalazationLanguage language)
    {
        if (languageChangeEvent != null)
            languageChangeEvent(language);
        currentLanguage = language;
        //ShowCurrentLanguage = currentLanguage.ToString();
    }

    public LocalazationLanguage GetCurrentLanguage()
    {
        return currentLanguage;
    }
}
