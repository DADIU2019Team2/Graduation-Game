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
        cam.GetComponent<CinemachineDollyCart>().m_Speed = Mathf.Abs(cam.GetComponent<CinemachineDollyCart>().m_Speed);
    }

    public void ResetCam(GameObject cam)
    {
        cam.GetComponent<CinemachineDollyCart>().m_Position = 0;
        cam.GetComponent<CinemachineDollyCart>().enabled = false;
        cam.GetComponent<PlayableDirector>().initialTime = 0;
        cam.GetComponent<PlayableDirector>().enabled = false;

    }

    public void ReverseCam(GameObject cam)
    {
        Debug.Log("");
        cam.GetComponent<CinemachineDollyCart>().enabled = true;
        cam.GetComponent<CinemachineDollyCart>().m_Speed = Mathf.Abs(cam.GetComponent<CinemachineDollyCart>().m_Speed) * -1;
        cam.GetComponent<PlayableDirector>().enabled = true;
    }
}
