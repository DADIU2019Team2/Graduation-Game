using System.Collections;
using System.Collections.Generic;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;

public class loadingscreentest : MonoBehaviour
{
    AsyncOperation operation;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Started");
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.G))
        {
            StartCoroutine("LoadSceneAsyncBar");
        }
        if (Input.GetKeyDown(KeyCode.W))
        {
            operation.allowSceneActivation = true;
        }
    }

    IEnumerator LoadSceneAsyncBar()
    {
        Debug.Log("Loading");
        operation = SceneManager.LoadSceneAsync(1);
        
        operation.allowSceneActivation = false;
        while (!operation.isDone)
        {
            Debug.Log(operation.progress +"%");
            yield return null;
        }

    }
}
