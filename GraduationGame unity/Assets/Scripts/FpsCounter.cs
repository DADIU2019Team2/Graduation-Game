using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FpsCounter : MonoBehaviour
{
    public static float fps;
    public static float avgFPS { get; set; }
    public static float highestFPS { get; set; }
    public static float lowestFPS { get; set; }
    public int frameRange;
    int[] fpsBuffer;
    int fpsBufferIndex;
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
        UpdateBuffer();
        CalculateFPS();
        Debug.Log("Avg FPS : " + avgFPS + ", Highest FPS : " + highestFPS + ", Lowest FPS : " + +lowestFPS + "    Value are for last " + frameRange + " frames");
    }
    void InitializeBuffer()
    {
        if (frameRange <= 0)
        {
            frameRange = 60;
        }
        fpsBuffer = new int[frameRange];
        fpsBufferIndex = 0;
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

    public static float GetAverageFPS()
    {
        return avgFPS;
    }
    public static float GetHighestFPS()
    {
        return highestFPS;
    }
    public static float GetLowestFPS()
    {
        return lowestFPS;
    }
}
