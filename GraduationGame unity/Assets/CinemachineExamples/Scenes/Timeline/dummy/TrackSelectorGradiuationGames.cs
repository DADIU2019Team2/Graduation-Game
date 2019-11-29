using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using Cinemachine;


public class TrackSelectorGradiuationGames : MonoBehaviour
{
    public void TransitionToCam(GameObject cam)
    {
        cam.GetComponent<CinemachineDollyCart>().enabled = true;
        cam.GetComponent<PlayableDirector>().enabled = true;
        cam.gameObject.GetComponent<CinemachineDollyCart>().m_Position = 0;
        cam.GetComponent<CinemachineVirtualCamera>().Priority = 11;
        cam.GetComponent<CinemachineDollyCart>().m_Speed = Mathf.Abs(cam.GetComponent<CinemachineDollyCart>().m_Speed);
        ChangeBrainCam(cam);
    }
    public void TransitionToCamNoTrack(GameObject cam)
    {
        if (cam.GetComponent<CinemachineDollyCart>() != null)
        {
        cam.GetComponent<CinemachineDollyCart>().enabled = false;
        }
        cam.GetComponent<PlayableDirector>().enabled = true;
        cam.GetComponent<CinemachineVirtualCamera>().Priority = 11;
        ChangeBrainCamNoTrack(cam);
    }

    public void ResetCam(GameObject cam)
    {
        cam.GetComponent<CinemachineDollyCart>().m_Position = 0;
        cam.GetComponent<CinemachineDollyCart>().enabled = false;
        cam.GetComponent<PlayableDirector>().enabled = false;
        InitialPositionContainer initialTransform = cam.GetComponent<InitialPositionContainer>();
        cam.transform.SetPositionAndRotation(initialTransform.initialPosition, initialTransform.InitialRotation); //should reset the cam properly
        cam.GetComponent<PlayableDirector>().initialTime = 0;
    }

    public void ReverseCam(GameObject cam)
    {
        
        cam.GetComponent<CinemachineDollyCart>().enabled = true;
        cam.GetComponent<CinemachineDollyCart>().m_Speed = Mathf.Abs(cam.GetComponent<CinemachineDollyCart>().m_Speed) * -1;
        cam.GetComponent<PlayableDirector>().enabled = true;
    }

    public void ChangeBrainCam(GameObject cam)
    {
        CinemachineVirtualCamera[] cams = FindObjectOfType<CameraReferences>().cameras;
        foreach (CinemachineVirtualCamera item in cams)
        {
            item.enabled = false;
            item.GetComponent<PlayableDirector>().time = 0;
            if (item.GetComponent<CinemachineDollyCart>() != null)
            {
            item.GetComponent<CinemachineDollyCart>().m_Position = 0;
            item.GetComponent<CinemachineDollyCart>().enabled = false;
            }
            item.GetComponent<PlayableDirector>().enabled = false;
            item.GetComponent<CinemachineVirtualCamera>().Priority = 0;
        }
        cam.GetComponent<CinemachineDollyCart>().enabled = true;
        cam.GetComponent<CinemachineDollyCart>().m_Position = 0;
        cam.GetComponent<CinemachineVirtualCamera>().Priority = 11;
        cam.GetComponent<CinemachineVirtualCamera>().enabled = true;
        cam.GetComponent<PlayableDirector>().enabled = true;

        
    }
    public void ChangeBrainCamNoTrack(GameObject cam)
    {
        CinemachineVirtualCamera[] cams = FindObjectOfType<CameraReferences>().cameras;
        foreach (CinemachineVirtualCamera item in cams)
        {
            item.enabled = false;
            item.GetComponent<PlayableDirector>().time = 0;
            if (item.GetComponent<CinemachineDollyCart>() != null)
            {
            item.GetComponent<CinemachineDollyCart>().m_Position = 0;
            item.GetComponent<CinemachineDollyCart>().enabled = false;
            }
            item.GetComponent<PlayableDirector>().enabled = false;
            item.GetComponent<CinemachineVirtualCamera>().Priority = 0;
        }
        cam.GetComponent<CinemachineVirtualCamera>().Priority = 11;
        cam.GetComponent<CinemachineVirtualCamera>().enabled = true;
        cam.GetComponent<PlayableDirector>().enabled = true;


    }

}
