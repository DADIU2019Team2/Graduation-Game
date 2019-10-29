using UnityEngine;
using UnityEditor;
[CustomEditor(typeof(SwipeAngleThresholds))]
public class SwipeAngleThresholdsEditor : Editor
{
    public override void OnInspectorGUI()
    {
        //base.OnInspectorGUI();
        SwipeAngleThresholds swipeThreshholds = (SwipeAngleThresholds)target;

        GUILayout.Label("Start and end angle for UpRight swipe:");
        GUILayout.BeginHorizontal();
        EditorGUILayout.FloatField("UpRight swipe angles:", swipeThreshholds.swipeUpRightAngles0);
        EditorGUILayout.FloatField(swipeThreshholds.swipeUpRightAngles1);
        GUILayout.EndHorizontal();

        GUILayout.Label("Start and end angle for Backwards swipe:");
        GUILayout.BeginHorizontal();
        EditorGUILayout.FloatField("Backwards swipe angles:", swipeThreshholds.swipeBackwardsAngles0);
        EditorGUILayout.FloatField(swipeThreshholds.swipeBackwardsAngles1);
        GUILayout.EndHorizontal();

        GUILayout.Label("Start and end angle for Down swipe:");
        GUILayout.BeginHorizontal();
        EditorGUILayout.FloatField("Down swipe angles:", swipeThreshholds.swipeDownAngles0);
        EditorGUILayout.FloatField(swipeThreshholds.swipeDownAngles1);
        GUILayout.EndHorizontal();

    }



}
