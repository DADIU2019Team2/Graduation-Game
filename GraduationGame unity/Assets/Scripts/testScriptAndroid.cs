using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class testScriptAndroid : MonoBehaviour
{
    private string androidStuff = "com.example.fuckandroid.MainActivity";
    AndroidJavaClass javaClass;
    public TextMeshProUGUI gui;
    public TextMeshProUGUI gui2;
    public TextMeshProUGUI gui3;
    public Text bigChungus;
    int isConnected;
    // Start is called before the first frame update

    AndroidJavaClass libClass;
    AndroidJavaObject libInstance;
    void Start()
    {
        libClass = new AndroidJavaClass("com.example.fuckandroid.MainActivity");
        //libInstance = libClass.CallStatic<AndroidJavaObject>("MainActivity", getContext());
        javaClass = new AndroidJavaClass(androidStuff);
        isConnected = libClass.CallStatic<int>("getStuffs");
        if (isConnected == 1)
        {
            gui3.text = "true!";
        }
        else if(isConnected == 2)
        {
            gui3.text = "false!";
        }
        else
        {
            gui3.text = "we heard nothing";
        }
        bigChungus.text = "yes";
        
        if (javaClass != null)
        {
            
            Debug.Log("I LIVE!");
            gui2.text = (javaClass.CallStatic<bool>("getStuffs")).ToString();
            Debug.Log(javaClass.CallStatic<string>("getStuff"));
            string temp = javaClass.CallStatic<string>("getStuff");
            if (temp == null)
            {
                temp = "failed to retrieve info";
            }
            gui.text = temp;
        }
    }
    private static AndroidJavaObject getContext()
    {
        AndroidJavaClass unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
        AndroidJavaObject activity = unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
        return activity.Call<AndroidJavaObject>("getApplicationContext");
    }

    // Update is called once per frame
    void Update()
    {
        libClass = new AndroidJavaClass("com.example.fuckandroid.MainActivity");
        //libInstance = libClass.CallStatic<AndroidJavaObject>("MainActivity", getContext());
        javaClass = new AndroidJavaClass(androidStuff);
        isConnected = libClass.CallStatic<int>("getStuffs");
        if (isConnected == 1)
        {
            gui3.text = "true!";
        }
        else if (isConnected == 2)
        {
            gui3.text = "false!";
        }
        else
        {
            gui3.text = isConnected.ToString();
        }
    }


    }
