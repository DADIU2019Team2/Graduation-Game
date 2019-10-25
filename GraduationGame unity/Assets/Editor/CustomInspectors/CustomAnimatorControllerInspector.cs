using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.Animations;
using UnityEditorInternal;

[CustomEditor(typeof(AnimatorControllerInspetor))]
[CanEditMultipleObjects]
public class CustomAnimatorControllerInspector : Editor
{
    private AnimatorControllerInspetor animController;
    private UnityEngine.AnimatorControllerParameter[] animControllerParams;

    private bool showDebugParams;

    SerializedProperty controller;
    SerializedProperty parametersToChange;
    private ReorderableList parameterNamesToCheck;

    private float lineHeight;
    private float lineheightSpace;


    private void OnEnable()
    {
        lineHeight = EditorGUIUtility.singleLineHeight;
        lineheightSpace = lineHeight + 10f;
        animController = (AnimatorControllerInspetor) this.target;
        if (animController.controller != null)
            animControllerParams = animController.controller.parameters;
        showDebugParams = false;

        controller = serializedObject.FindProperty("controller");
        parametersToChange = serializedObject.FindProperty("parametersToChange");

        parameterNamesToCheck = new ReorderableList(serializedObject, parametersToChange, true, true, true, true);

        
    }

    public override void OnInspectorGUI()
    {
        //base.OnInspectorGUI();
        animController = (AnimatorControllerInspetor)this.target;
        serializedObject.Update();
        EditorGUILayout.ObjectField(controller);
        if(controller.objectReferenceValue != null)
        {
            //DrawDefaultInspector();
            /*if(GUILayout.Button("Add parameter to change"))
            {
                //add a string field
            }*/

            //parameterNamesToCheck.DoLayoutList();

            #region display/update Controller parameters
            showDebugParams = EditorGUILayout.BeginFoldoutHeaderGroup(showDebugParams, "Debug controller Params");
            if(animController.controller != null && showDebugParams)
            {
                int originIndentLevel = EditorGUI.indentLevel;
                EditorGUI.indentLevel = originIndentLevel + 1;
                UnityEditor.Animations.AnimatorController controller = animController.controller;
                UnityEngine.AnimatorControllerParameter[] tempParams = new UnityEngine.AnimatorControllerParameter[controller.parameters.Length];
                GUILayout.BeginVertical();
                for (int i = 0; i < animController.controller.parameters.Length; i++)
                //for (int i = animController.controller.parameters.Length - 1; i >= 0; i--)
                {
                    switch (controller.parameters[i].type)
                    {
                        case UnityEngine.AnimatorControllerParameterType.Float:
                            float newFloat = EditorGUILayout.FloatField(controller.parameters[i].name, controller.parameters[i].defaultFloat);
                            string newFloatName = controller.parameters[i].name;

                            UnityEngine.AnimatorControllerParameter floatParam = new UnityEngine.AnimatorControllerParameter();
                            floatParam.name = newFloatName;
                            floatParam.type = UnityEngine.AnimatorControllerParameterType.Float;
                            floatParam.defaultFloat = newFloat;
                            tempParams[i] = floatParam;
                            break;
                        case UnityEngine.AnimatorControllerParameterType.Bool:
                            bool newBool = EditorGUILayout.Toggle(controller.parameters[i].name, controller.parameters[i].defaultBool);
                            string newBoolName = controller.parameters[i].name;

                            UnityEngine.AnimatorControllerParameter boolParam = new UnityEngine.AnimatorControllerParameter();
                            boolParam.name = newBoolName;
                            boolParam.type = UnityEngine.AnimatorControllerParameterType.Bool;
                            boolParam.defaultBool = newBool;
                            tempParams[i] = boolParam;
                            break;
                        case UnityEngine.AnimatorControllerParameterType.Int:                        
                            int newInt = EditorGUILayout.IntField(controller.parameters[i].name, controller.parameters[i].defaultInt);
                            string newIntName = controller.parameters[i].name;

                            UnityEngine.AnimatorControllerParameter intParam = new UnityEngine.AnimatorControllerParameter();
                            intParam.name = newIntName;
                            intParam.type = UnityEngine.AnimatorControllerParameterType.Int;
                            intParam.defaultInt = newInt;
                            tempParams[i] = intParam;
                            break;
                        case UnityEngine.AnimatorControllerParameterType.Trigger:

                            tempParams[i] = controller.parameters[i];
                            break;
                    }
                }
                for (int i = controller.parameters.Length - 1; i >= 0; i--)
                {
                    controller.RemoveParameter(i);
                }
                for (int i = 0; i < tempParams.Length; i++)
                {
                    controller.AddParameter(tempParams[i]);
                }
                GUILayout.EndVertical();
                EditorGUI.indentLevel = originIndentLevel;
                EditorGUILayout.EndFoldoutHeaderGroup();
            }
            #endregion

        //EditorGUILayout.PropertyField(parametersToChangeName);
        }
        serializedObject.ApplyModifiedProperties();


    }
}
