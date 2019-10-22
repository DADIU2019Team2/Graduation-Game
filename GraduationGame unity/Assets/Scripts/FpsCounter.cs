using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class FpsCounter : MonoBehaviour
{
    public enum FPSType{All, avgFPS, fps, highestFPS, LowestFPS}
    public FPSType fpsType;
    public TextMeshProUGUI tmText;
    public static float actualFPS;
    public static float avgFPS { get; set; }
    public static float highestFPS { get; set; }
    public static float lowestFPS { get; set; }
    public int frameRange;
    int[] fpsBuffer;
    int fpsBufferIndex;


    public float updateInterval = 1f;
    private float accum;
    private int frames;
    private float timeLeft;
    private float fps;
    private float lastSample;
    private int gottenIntervals;
    // Start is called before the first frame update
    void Start()
    {
        timeLeft = updateInterval;
        lastSample = Time.realtimeSinceStartup;
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
        //Debug.Log("Avg FPS : " + avgFPS + ", Highest FPS : " + highestFPS + ", Lowest FPS : " + +lowestFPS + "    Value are for last " + frameRange + " frames");
        if(tmText != null)
        {
            writeFPS();
        }

        //more fps
        ++frames;
        float newSample = Time.realtimeSinceStartup;
        float deltaTime = newSample - lastSample;
        lastSample = newSample;

        timeLeft -= deltaTime;
        accum += 1.0f / deltaTime;

        //interval ended
        if(timeLeft <= 0.0f)
        {
            fps = accum/frames;
            timeLeft = updateInterval;
            accum = 0.0f;
            frames = 0;
            ++gottenIntervals;
        }
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
            int _fps = fpsBuffer[i];
            sum += _fps;
            if (_fps > highest)
            {
                highest = _fps;
            }
            if (_fps < lowest)
            {
                lowest = _fps;
            }
            if (_fps < 10)
            {
                //Debug.Log("LOW FPS " + fps);

            }
        }
        avgFPS = sum / frameRange;
        highestFPS = highest;
        lowestFPS = lowest;
    }

    public float getFPSCount()
    {
        //return oneSecfpsBuffer.Count;
        return fps;
    }
    private bool hasFPS()
    {
        return gottenIntervals > 2;
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
        case FPSType.All:
            string lineToWrite = "FPS count: " + getFPSCount().ToString("F0") + "   avg FPS: " + GetAverageFPS().ToString() +
                "   Highest FPS: " + GetHighestFPS().ToString() + "   Lowest FPS: " + GetLowestFPS().ToString();
            tmText.text = lineToWrite;
            break;
        }
    }
}
