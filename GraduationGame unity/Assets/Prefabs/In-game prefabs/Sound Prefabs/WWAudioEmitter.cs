using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WWAudioEmitter : MonoBehaviour {

public string EventName = "default";
public string StopEvent = "default";
private bool IsInCollider = false;



    // Start is called before the first frame update
    void Start()
    {
        AkSoundEngine.RegisterGameObj(gameObject);
    }
    

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        IsInCollider = true;
        AkSoundEngine.PostEvent(EventName, gameObject);
Debug.Log("in sound collider");
    }
    
        private void OnTriggerExit(Collider other)
    {
        if (other.tag != "Player" || !IsInCollider) { return; }
        AkSoundEngine.PostEvent(StopEvent, gameObject);
        IsInCollider = false;
Debug.Log("in sound collider");
    }

        private void OnTriggerStay(Collider other)
    {
        if (other.tag != "Player" || IsInCollider) { return; }
        IsInCollider = true;
        AkSoundEngine.PostEvent(EventName, gameObject);
        Debug.Log("in sound collider");
        
    }

}