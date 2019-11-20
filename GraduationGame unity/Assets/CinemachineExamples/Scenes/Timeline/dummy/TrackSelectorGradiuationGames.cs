using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using Cinemachine;


public class TrackSelectorGradiuationGames : MonoBehaviour
{
    public void TransitionToCam(GameObject cam)
    {
        ChangeBrainCam(cam);
        cam.GetComponent<CinemachineDollyCart>().enabled = true;
        cam.GetComponent<PlayableDirector>().enabled = true;
        cam.GetComponent<CinemachineDollyCart>().m_Speed = Mathf.Abs(cam.GetComponent<CinemachineDollyCart>().m_Speed);
    }

    public void ResetCam(GameObject cam)
    {
        cam.GetComponent<CinemachineDollyCart>().enabled = false;
        cam.GetComponent<PlayableDirector>().enabled = false;
        cam.GetComponent<CinemachineDollyCart>().m_Position = 0;
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
            item.GetComponent<PlayableDirector>().enabled = false;
            item.GetComponent<CinemachineDollyCart>().enabled = false;
            item.gameObject.GetComponent<CinemachineDollyCart>().m_Position = 0;
            item.GetComponent<PlayableDirector>().time = 0;
        }
        cam.gameObject.GetComponent<CinemachineDollyCart>().m_Position = 0;
        cam.GetComponent<CinemachineVirtualCamera>().enabled = true;
        cam.GetComponent<CinemachineDollyCart>().enabled = true;
        cam.GetComponent<PlayableDirector>().enabled = true;
    }

}
