using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class FpsCounter : MonoBehaviour
{
    public enum FPSType{avgFPS, fps, highestFPS, LowestFPS}
    public FPSType fpsType;
    public TextMeshProUGUI tmText;
    public static float fps;
    public static float actualFPS;
    public static float avgFPS { get; set; }
    public static float highestFPS { get; set; }
    public static float lowestFPS { get; set; }
    public int frameRange;
    int[] fpsBuffer;
    int fpsBufferIndex;
    Queue<int> oneSecfpsBuffer;
    int framesInLastOneSec;
    //int oneSecFPSIndex;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (fpsBuffer == null || fpsBuffer.Length != frameRange)
        {
            InitializeBuffer();
        }
        updateOneSecFPS();
        UpdateBuffer();
        CalculateFPS();
        //Debug.Log("Avg FPS : " + avgFPS + ", Highest FPS : " + highestFPS + ", Lowest FPS : " + +lowestFPS + "    Value are for last " + frameRange + " frames");
        if(tmText != null)
        {
            writeFPS();
        }
    }

    private void updateOneSecFPS()
    {
        oneSecfpsBuffer.Enqueue(framesInLastOneSec);
        StartCoroutine(popQueAfterSec());
    }
    void InitializeBuffer()
    {
        if (frameRange <= 0)
        {
            frameRange = 60;
        }
        fpsBuffer = new int[frameRange];
        fpsBufferIndex = 0;

        oneSecfpsBuffer = new Queue<int>();
        framesInLastOneSec = 0;
    }

    void UpdateBuffer()
    {
        fpsBuffer[fpsBufferIndex++] = (int)(1f / Time.unscaledDeltaTime);
        if (fpsBufferIndex >= frameRange)
        {
            fpsBufferIndex = 0;
        }
    }
    void CalculateFPS()
    {
        int sum = 0;
        int highest = 0;
        int lowest = int.MaxValue;
        for (int i = 0; i < frameRange; i++)
        {
            int fps = fpsBuffer[i];
            sum += fps;
            if (fps > highest)
            {
                highest = fps;
            }
            if (fps < lowest)
            {
                lowest = fps;
            }
            if (fps < 10)
            {
                Debug.Log("LOW FPS " + fps);

            }
        }
        avgFPS = sum / frameRange;
        highestFPS = highest;
        lowestFPS = lowest;
    }

    public float getFPSCount()
    {
        return oneSecfpsBuffer.Count;
    }
    public float GetAverageFPS()
    {
        return avgFPS;
    }
    public float GetHighestFPS()
    {
        return highestFPS;
    }
    public float GetLowestFPS()
    {
        return lowestFPS;
    }

    public void writeFPS()
    {
        switch (fpsType)
        {
        case FPSType.fps:
            tmText.text = "FPS count: " + getFPSCount().ToString();
            break;
        case FPSType.avgFPS:
            tmText.text = "avg FPS: " + GetAverageFPS().ToString();
            break;
        case FPSType.highestFPS:
            tmText.text = "Highest FPS: " + GetHighestFPS().ToString();
            break;
        case FPSType.LowestFPS:
            tmText.text = "Lowest FPS: " + GetLowestFPS().ToString();
            break;
        }
    }

    IEnumerator popQueAfterSec()
    {
        yield return new WaitForSeconds(1f);
        if(oneSecfpsBuffer.Count > 0)
            oneSecfpsBuffer.Dequeue();
    }
}
