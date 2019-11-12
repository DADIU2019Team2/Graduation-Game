using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New localizationSystem", menuName = "ScriptableObject/Localization/New localization system")]
public class Language : ScriptableObject
{
    //public string ShowCurrentLanguage; //only for show not actually used
    public enum LocalazationLanguage { English, Dansk };
    [SerializeField] private static LocalazationLanguage currentLanguage;

    public void SetLanguage(LocalazationLanguage language)
    {
        currentLanguage = language;
        //ShowCurrentLanguage = currentLanguage.ToString();
    }

    public LocalazationLanguage GetCurrentLanguage()
    {
        return currentLanguage;
    }
}
