using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

//[RequireComponent(typeof(Text))]
public class AutoTranslator : MonoBehaviour
{
    public string textKey;


    void OnEnable()
    {
        //OnLanguageChange();
    }
    public void OnLanguageChange()
    {
        if(GetComponent<Text>() != null)
        {
            Text textElement = GetComponent<Text>();
            textElement.text = LocalizationManager.TranslateKey(textKey);
        }
        else if(GetComponent<TextMeshProUGUI>() != null)
        {
            TextMeshProUGUI textElement = GetComponent<TextMeshProUGUI>();
            textElement.text = LocalizationManager.TranslateKey(textKey);
        }
    }
}
