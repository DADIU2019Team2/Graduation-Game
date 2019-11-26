using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class LoadScreenText : MonoBehaviour
{
    public TextMeshProUGUI loadText;
    public string baseString = "Loading";
    private string dot = ".";
    private int amountOfDots;
    public float timeLimit = 1f;
    private float timer;

    private void Start()
    {
        timer = 0;
        loadText = GetComponent<TextMeshProUGUI>();
    }

    private void Update()
    {
        timer += Time.unscaledDeltaTime;
        if (timer > timeLimit)
        {
            amountOfDots++;
            Debug.Log("Timer over timelimit");
            loadText.text = baseString;
            for (int i = 0; i < amountOfDots; i++)
            {
                loadText.text += ".";
            }
            timer = 0;
            if (amountOfDots == 3)
            {
                amountOfDots = 0;
            }
        }
    }
}
