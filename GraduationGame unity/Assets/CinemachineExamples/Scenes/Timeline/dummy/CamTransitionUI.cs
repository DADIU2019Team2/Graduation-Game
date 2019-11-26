using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;
using UnityEngine.Playables;

public class CamTransitionUI : MonoBehaviour
{
    public GameObject uiToActivate;
    public GameObject lightToActivate;

    public void SetUIToActivate(GameObject ui)
    {
        uiToActivate = ui;
    }

    public void SetLightToActivate(GameObject light)
    {
        lightToActivate = light;
    }

    public void ActivateDelayedUI(GameObject cam)
    {
        StartCoroutine(CheckForActiavtion(cam));
    }

    public void ActivateDelayedDirectorUI(GameObject cam)
    {

        StartCoroutine(CheckForActiavtionDirector(cam));
    }
    public void ActivateDelayedDirectorLight(GameObject light)
    {

        StartCoroutine(CheckForActiavtionDirectorLight(light));
    }

    public void ActivateDelayedLight(GameObject light)
    {
        StartCoroutine(DelayedLightEnumerator(light));
    }

    IEnumerator DelayedLightEnumerator(GameObject light)
    {
        float pathLength = light.GetComponent<CinemachineDollyCart>().m_Path.PathLength;
        float speed = light.GetComponent<CinemachineDollyCart>().m_Speed;
        while (true)
        {
            if (speed > 0 && light.GetComponent<CinemachineDollyCart>().m_Position >= pathLength)
            {
                Debug.Log("Activate light");
                lightToActivate.SetActive(true);
                yield break;
            }
            else if (speed < 0 && light.GetComponent<CinemachineDollyCart>().m_Position <= 0)
            {
                Debug.Log("Activate");
                lightToActivate.SetActive(true);
                yield break;
            }
            yield return new WaitForEndOfFrame();
        }
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

    IEnumerator CheckForActiavtionDirector(GameObject cam)
    {
        PlayableDirector camDirector = cam.GetComponent<PlayableDirector>();
        double directorDuration = camDirector.duration;
        
        while (true)
        {
            if (camDirector.time >= directorDuration )
            {
                

                Debug.Log("Activate");
                uiToActivate.SetActive(true);
                yield break;
            }
            yield return new WaitForEndOfFrame();
        }
    }
    IEnumerator CheckForActiavtionDirectorLight(GameObject cam)
    {
        PlayableDirector camDirector = cam.GetComponent<PlayableDirector>();
        double directorDuration = camDirector.duration;

        while (true)
        {
            if (camDirector.time >= directorDuration)
            {


                Debug.Log("Activate");
                lightToActivate.SetActive(!lightToActivate.activeSelf);
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
