﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;
using UnityEngine.Playables;

public class CamTransitionUI : MonoBehaviour
{
    public GameObject uiToActivate;


    public void SetUIToActivate(GameObject ui)
    {
        uiToActivate = ui;
    }

    public void ActivateDelayedUI(GameObject cam)
    {
        StartCoroutine(CheckForActiavtion(cam));
    }

    IEnumerator CheckForActiavtion(GameObject cam)
    {
        float pathLength = cam.GetComponent<CinemachineDollyCart>().m_Path.PathLength;
        float speed = cam.GetComponent<CinemachineDollyCart>().m_Speed;
        while (true)
        {
            if (speed > 0 && cam.GetComponent<CinemachineDollyCart>().m_Position >= pathLength)
            {
                Debug.Log("Activate");
                uiToActivate.SetActive(true);
                yield break;
            }
            else if (speed < 0 && cam.GetComponent<CinemachineDollyCart>().m_Position <= 0)
            {
                Debug.Log("Activate");
                uiToActivate.SetActive(true);
                yield break;
            }
            yield return new WaitForEndOfFrame();
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
