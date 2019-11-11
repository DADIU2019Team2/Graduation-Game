using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Button))]
public class SetLanguage : MonoBehaviour
{
    [SerializeField] private Language languageSystem;
    [SerializeField] private Language.LocalazationLanguage desiredLanguage;
    private Button button;

    private void Start()
    {

        button = GetComponent<Button>();

        button.onClick.AddListener(delegate { _SetLanguage(); });
    }

    void _SetLanguage()
    {
        languageSystem.SetLanguage(desiredLanguage);
    }
}
