using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MiniGame2.Events;

public class RaiseIntEvent : MonoBehaviour
{
    public IntEvent intEvent;

    public void RaiseEvent(int i)
    {
        intEvent.Raise(i);
    }
}
