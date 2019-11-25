using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class DebugTimeScale : MonoBehaviour
{
    private TextMeshProUGUI tex;

    private void Start()
    {
        tex = GetComponent<TextMeshProUGUI>();
    }

    private void Update()
    {
        tex.text = "TimeScale = " + Time.timeScale;
    }
}
