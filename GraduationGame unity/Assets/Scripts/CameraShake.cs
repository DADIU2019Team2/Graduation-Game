using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;


public class CameraShake : MonoBehaviour
{
    public CameraShakeSettings settings;
    const float maxAngle = 10f;
    IEnumerator currentShakeCoroutine;

    public void StartShake(CameraShakeSettings properties)
    {
        if (currentShakeCoroutine != null)
        {
            StopCoroutine(currentShakeCoroutine);
        }

        currentShakeCoroutine = Shake(properties);
        StartCoroutine(currentShakeCoroutine);
    }

    private void Update()
    {
        if (Input.GetKeyDown("q"))
        {
            StartShake(settings);
        }
    }

    IEnumerator Shake(CameraShakeSettings settings)
    {
        float completionPercent = 0;
        float movePercent = 0;

        float angle_radians = settings.angle * Mathf.Deg2Rad - Mathf.PI;
        Vector3 previousWaypoint = Vector3.zero;
        Vector3 currentWaypoint = Vector3.zero;
        float moveDistance = 0;
        float speed = 0;

        Quaternion targetRotation = Quaternion.identity;
        Quaternion previousRotation = Quaternion.identity;

        do
        {
            if (movePercent >= 1 || completionPercent == 0)
            {
                float dampingFactor = DampingCurve(completionPercent, settings.dampingPercent);
                float noiseAngle = (Random.value - .5f) * Mathf.PI;
                angle_radians += Mathf.PI + noiseAngle * settings.noisePercent;
                currentWaypoint = new Vector3(Mathf.Cos(angle_radians), Mathf.Sin(angle_radians)) *
                                  settings.strength * dampingFactor;
                previousWaypoint = transform.localPosition;
                moveDistance = Vector3.Distance(currentWaypoint, previousWaypoint);

                targetRotation = Quaternion.Euler(new Vector3(currentWaypoint.y, currentWaypoint.x).normalized *
                                                  settings.rotationPercent * dampingFactor * maxAngle);
                previousRotation = transform.localRotation;

                speed = Mathf.Lerp(settings.minSpeed, settings.maxSpeed, dampingFactor);

                movePercent = 0;
            }

            completionPercent += Time.deltaTime / settings.duration;
            movePercent += Time.deltaTime / moveDistance * speed;
            transform.localPosition = Vector3.Lerp(previousWaypoint, currentWaypoint, movePercent);
            transform.localRotation = Quaternion.Slerp(previousRotation, targetRotation, movePercent);


            yield return null;
        } while (moveDistance > 0);
    }

    float DampingCurve(float x, float dampingPercent)
    {
        x = Mathf.Clamp01(x);
        float a = Mathf.Lerp(2, .25f, dampingPercent);
        float b = 1 - Mathf.Pow(x, a);
        return b * b * b;
    }
}