using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class SceneNameText : MonoBehaviour
{

    public TextMeshProUGUI screenText; //Assign in inspector.

    // Start is called before the first frame update
    void Start()
    {
        screenText.text = SceneManager.GetActiveScene().name;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
