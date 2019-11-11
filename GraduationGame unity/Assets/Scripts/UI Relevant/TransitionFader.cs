using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TransitionFader : MonoBehaviour
{
    [SerializeField]private CanvasGroup canvasGroup;
    [SerializeField]private GameObject canvas;
    [SerializeField]private GameObject loadScreenImage;
    [SerializeField]private GameObject blackScreenImage;

    private bool isEnabled; //not used atm
    private bool isSceneLoad; //not used atm

    private Coroutine lastRoutine = null;

    private void Awake()
    {
        //canvasGroup = GetComponentInChildren<CanvasGroup>();
        //canvas = canvasGroup.gameObject;
        loadScreenImage.SetActive(false);
        blackScreenImage.SetActive(false);
    }

    private void Start()
    {
        isEnabled = false;
        isSceneLoad = false;
    }

    /*private void Update()
    {
        if (Input.GetKeyDown(KeyCode.RightArrow))
        {
            GameManager.ChangeGameState(GameStateScriptableObject.GameState.levelLoss);
        }
        if (Input.GetKeyDown(KeyCode.LeftArrow))
        {
            GameManager.ChangeGameState(GameStateScriptableObject.GameState.levelStart);
        }
        if (Input.GetKeyDown(KeyCode.Space))
        {
            GameManager.ChangeGameState(GameStateScriptableObject.GameState.levelComplete);
        }
    }*/

    void disableCanvas()
    {
        canvas.SetActive(false);
        loadScreenImage.SetActive(false);
        blackScreenImage.SetActive(false);
        isEnabled = false;
    }
    void enableCanvas()
    {
        canvas.SetActive(true);
        isEnabled = true;
    }
    public void fadeIn(float fadeTime, bool _isSceneLoad)
    {
        //canvasGroup.alpha = 1;
        if (_isSceneLoad)
        {
            loadScreenImage.SetActive(true);
        }
        else
        {
            blackScreenImage.SetActive(true);
        }
        enableCanvas();
        if(lastRoutine != null)
            StopCoroutine(lastRoutine);
        lastRoutine = StartCoroutine(_fadeIn(fadeTime)); 
    }

    IEnumerator _fadeIn(float fadetim)
    {
        //float t = 0;
        float step = canvasGroup.alpha;
        while (canvasGroup.alpha > 0)
        {
            step -= 1 / fadetim * Time.unscaledDeltaTime;
            //t += Time.deltaTime;
            //canvasGroup.alpha = 1-(t / fadetim);

            canvasGroup.alpha = Mathf.Lerp(0, 1, step);
            yield return new WaitForSeconds(0);
        }
        disableCanvas();
    }

    public void fadeOut(float fadeTime, bool _isSceneLoad)
    {
        //canvasGroup.alpha = 0;
        if (_isSceneLoad)
        {
            loadScreenImage.SetActive(true);
        }
        else
        {
            Debug.Log("Enable black");
            blackScreenImage.SetActive(true);
        }
        enableCanvas();
        if(lastRoutine != null)
            StopCoroutine(lastRoutine);
        lastRoutine = StartCoroutine(_fadeOut(fadeTime, _isSceneLoad));
    }
    IEnumerator _fadeOut(float fadetim, bool _isSceneLoad)
    {
        /*float t = 0;
        while (t <= fadetim)
        {
            t = t + Time.deltaTime;
            canvasGroup.alpha = t / fadetim;
            yield return new WaitForSeconds(0f);
        }*/

        //float t = 0;
        float step = canvasGroup.alpha;
        while (canvasGroup.alpha < 1)
        {
            step += 1 / fadetim * Time.unscaledDeltaTime;
            //t += Time.deltaTime;
            //canvasGroup.alpha = 1-(t / fadetim);

            canvasGroup.alpha = Mathf.Lerp(0, 1, step);
            yield return new WaitForSeconds(0);
        }
        //disableCanvas();
    }

    public float getAlpha()
    {
        return canvasGroup.alpha;
    }
}
