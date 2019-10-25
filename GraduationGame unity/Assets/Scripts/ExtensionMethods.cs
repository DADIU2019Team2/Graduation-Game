using UnityEngine;
using System;
using UnityEditor;
using System.Collections.Generic;
using UnityEngine;

public static class ExtensionMethods
{

    #region Transform

    /// <summary>
    /// Reset the specified transform.
    /// </summary>
    /// <param name="transform">Transform.</param>
    public static void Reset(this Transform transform)
    {
        transform.position = Vector3.zero;
        transform.rotation = Quaternion.identity;
        transform.localScale = Vector3.one;
    }

    /// <summary>
    /// Resets the local coordinate.
    /// </summary>
    /// <param name="transform">Transform.</param>
    public static void ResetLocal(this Transform transform)
    {
        transform.localPosition = Vector3.zero;
        transform.localRotation = Quaternion.identity;
        transform.localScale = Vector3.one;
    }

    public static float Distance(this Transform transform, Transform other)
    {
        return Vector3.Distance(transform.position, other.position);
    }

    public static float FlatXZDistance(this Transform transform, Transform other)
    {
        return Vector2.Distance(new Vector2(transform.position.x, transform.position.z), new Vector2(other.position.x, other.position.z));
    }

    public static Vector3 DirectionTo(this Transform transform, Transform other)
    {
        return other.position - transform.position;
    }

    public static Vector2 FlatXZDirectionTo(this Transform transform, Transform other)
    {
        return new Vector2(other.position.x, other.position.z) - new Vector2(transform.position.x, transform.position.z);
    }

    public static bool IsWithinLineOfSight(this Transform transform, Transform other, float degrees)
    {
        float angle = Vector3.Angle(other.position - transform.position, transform.forward);

        if (angle < degrees * 0.5f)
        {
            return true;
        }

        return false;
    }

    public static void AddChildren(this Transform transform, GameObject[] children)
    {
        foreach (GameObject g in children)
        {
            g.transform.SetParent(transform);
        }
    }

    public static void AddChildren(this Transform transform, Transform[] children)
    {
        foreach (Transform t in children)
        {
            t.SetParent(transform);
        }
    }

    public static void ResetChildTransforms(this Transform transform)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            transform.GetChild(i).localPosition = Vector3.zero;
            transform.GetChild(i).localScale = Vector3.one;
            transform.GetChild(i).localRotation = Quaternion.identity;
        }
    }

    public static void ResetChildPositions(this Transform transform)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            transform.GetChild(i).localPosition = Vector3.zero;
        }
    }

    public static void ResetChildScales(this Transform transform)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            transform.GetChild(i).localScale = Vector3.one;
        }
    }

    public static void ResetChildRotations(this Transform transform)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            transform.GetChild(i).localRotation = Quaternion.identity;
        }
    }

    public static T[] GetComponentsInChildrenWithoutParent<T>(this Transform transform) where T : Component
    {
        List<T> targets = new List<T>();
        targets.AddRange(transform.GetComponentsInChildren<T>());

        for (int i = 0; i < targets.Count; i++)
        {
            if (targets[i].transform == transform)
            {
                targets.RemoveAt(i);
                i--;
            }
        }

        return targets.ToArray();
    }

    #endregion

    #region Vector3

    public static bool IsWithinCube(this Vector3 v, float minX, float minY, float minZ, float maxX, float maxY, float maxZ)
    {
        return v.x >= minX && v.x <= maxX && v.y >= minY && v.y <= maxY && v.z >= minZ && v.z <= maxZ;
    }

    public static Vector3 FlatRotate(this Vector3 v, float angle)
    {
        return new Vector3(v.x * Mathf.Cos(angle * Mathf.Deg2Rad) - v.z * Mathf.Sin(angle * Mathf.Deg2Rad), 0f, v.x * Mathf.Sin(angle * Mathf.Deg2Rad) + v.z * Mathf.Cos(angle * Mathf.Deg2Rad));
    }

    public static Vector3 GetClosest(this Vector3 position, IEnumerable<Vector3> otherPositions)
    {
        Vector3 closest = Vector3.zero;
        float shortestDistance = Mathf.Infinity;

        foreach (Vector3 otherPos in otherPositions)
        {
            float distance = (position - otherPos).magnitude;
            if (distance < shortestDistance)
            {
                closest = otherPos;
                shortestDistance = distance;
            }
        }

        return closest;
    }

    public static int GetIndexOfClosest(this Vector3 position, IEnumerable<Vector3> otherPositions)
    {
        int closest = 0;
        float shortestDistance = Mathf.Infinity;

        int count = 0;
        foreach (Vector3 otherPos in otherPositions)
        {
            float distance = (position - otherPos).magnitude;

            if (distance < shortestDistance)
            {
                closest = count;
                shortestDistance = distance;
            }

            count++;
        }

        return closest;
    }

    public static Vector2 GetXZVector2(this Vector3 v)
    {
        return new Vector2(v.x, v.z);
    }

    public static Vector3 GetXZVector3(this Vector3 v)
    {
        return new Vector3(v.x, 0f, v.z);
    }

    public static Vector2 GetXYVector2(this Vector3 v)
    {
        return (Vector2)v;
    }

    public static Vector3 GetXYVector3(this Vector3 v)
    {
        return new Vector3(v.x, v.y, 0f);
    }

    public static Vector2 GetYZVector2(this Vector3 v)
    {
        return new Vector2(v.y, v.z);
    }

    public static Vector3 GetYZVector3(this Vector3 v)
    {
        return new Vector3(0f, v.y, v.z);
    }

    public static float Distance(this Vector3 v, Vector3 other)
    {
        return (v - other).magnitude;
    }

    public static float FlatXZDistance(this Vector3 v, Vector3 other)
    {
        return Vector2.Distance(new Vector2(v.x, v.z), new Vector2(other.x, other.z));
    }

    public static Vector3 DirectionTo(this Vector3 v, Vector3 other)
    {
        return other - v;
    }

    public static Vector2 FlatXZDirectionTo(this Vector3 v, Vector3 other)
    {
        return new Vector2(other.x, other.z) - new Vector2(v.x, v.z);
    }

    public static Vector2[] ToXYVector2Array(this Vector3[] v3)
    {
        return System.Array.ConvertAll(v3, GetV3XYFromV2);
    }

    public static Vector2[] ToXZVector2Array(this Vector3[] v3)
    {
        return System.Array.ConvertAll(v3, GetV3XZFromV2);
    }

    private static Vector2 GetV3XYFromV2(Vector3 v3)
    {
        return new Vector2(v3.x, v3.y);
    }

    private static Vector2 GetV3XZFromV2(Vector3 v3)
    {
        return new Vector2(v3.x, v3.y);
    }

    public static Vector3[] ToVector3Array(this Vector2[] v2)
    {
        return System.Array.ConvertAll(v2, new System.Converter<Vector2, Vector3>((Vector2 vector2) => {
            return vector2;
        }));
    }

    public static Vector4[] ToVector4Array(this Vector2[] v2)
    {
        return System.Array.ConvertAll(v2, new System.Converter<Vector2, Vector4>((Vector2 vector2) => {
            return vector2;
        }));
    }
    #endregion

    #region GameObject

    public static bool HasComponent<T>(this GameObject gameObject) where T : Component
    {
        return gameObject.GetComponent<T>() != null;
    }

    #endregion

    #region Component

    public static bool HasComponent<T>(this Component component) where T : Component
    {
        return component.GetComponent<T>() != null;
    }

    public static T GetComponentInChildrenWithoutParent<T>(this Component component) where T : Component
    {
        List<T> targets = new List<T>();
        targets.AddRange(component.GetComponentsInChildren<T>());

        for (int i = 0; i < targets.Count; i++)
        {
            if (targets[i].transform == component.transform)
            {
                targets.RemoveAt(i);
                i--;
            }
        }

        return targets[0];
    }

    public static T[] GetComponentsInChildrenWithoutParent<T>(this Component component) where T : Component
    {
        List<T> targets = new List<T>();
        targets.AddRange(component.GetComponentsInChildren<T>());

        for (int i = 0; i < targets.Count; i++)
        {
            if (targets[i].transform == component.transform)
            {
                targets.RemoveAt(i);
                i--;
            }
        }

        return targets.ToArray();
    }

    #endregion

    #region Vector3Int

    public static Vector3 ToVector3(this Vector3Int vector)
    {
        return new Vector3((float)vector.x, (float)vector.y, (float)vector.z);
    }

    #endregion

    #region Vector2

    public static bool IsWithinRect(this Vector2 v, float minX, float minY, float maxX, float maxY)
    {
        return v.x >= minX && v.x <= maxX && v.y >= minY && v.y <= maxY;
    }

    public static Vector2 Rotate(this Vector2 v, float degrees)
    {
        float sin = Mathf.Sin(degrees * Mathf.Deg2Rad);
        float cos = Mathf.Cos(degrees * Mathf.Deg2Rad);

        float tx = v.x;
        float ty = v.y;
        v.x = (cos * tx) - (sin * ty);
        v.y = (sin * tx) + (cos * ty);
        return v;
    }

    public static Vector3 ToVector3XZ(this Vector2 v, float? y = null)
    {
        return new Vector3(v.x, y ?? 0f, v.y);
    }

    public static Vector2 PerpendicularClockwise(this Vector2 vector2)
    {
        return new Vector2(vector2.y, -vector2.x);
    }

    public static Vector2 PerpendicularCounterClockwise(this Vector2 vector2)
    {
        return new Vector2(-vector2.y, vector2.x);
    }

    #endregion

    #region List

    public static void ContainElseAdd<T>(this List<T> list, T obj) where T : UnityEngine.Object
    {
        if (!list.Contains(obj))
        {
            list.Add(obj);
        }
    }

    #endregion

    #region Color

    public static Color ChangeAlpha(this Color color, float alpha)
    {
        return new Color(color.r, color.g, color.b, alpha);
    }

    #endregion

    public static T[] SubArray<T>(this T[] data, int index, int length)
    {
        T[] result = new T[length];
        System.Array.Copy(data, index, result, 0, length);
        return result;
    }

    public static double Lerp(this double from, double towards, float fraction)
    {
        return from + (towards - from) * Mathf.Clamp01(fraction);
    }

    public static long Lerp(this long from, long towards, float fraction)
    {
        return from + (towards - from) * (long)Mathf.Clamp01(fraction);
    }

    public static Rect RectTransformToScreenSpace(this RectTransform transform)
    {
        Vector2 size = Vector2.Scale(transform.rect.size, transform.lossyScale);
        float x = transform.position.x + transform.anchoredPosition.x;
        float y = Screen.height - transform.position.y - transform.anchoredPosition.y;

        return new Rect(x, y, size.x, size.y);
    }


public static void RemovePropertyArrayElement(this SerializedProperty list, int index)
    {
        if (list == null)
            throw new ArgumentNullException();

        if (!list.isArray)
            throw new ArgumentException("Property is not an array");

        if (index < 0 || index >= list.arraySize)
            throw new IndexOutOfRangeException();

        list.GetArrayElementAtIndex(index).SetPropertyValue(null);
        list.DeleteArrayElementAtIndex(index);

        list.serializedObject.ApplyModifiedProperties();
    }

    public static void SetPropertyValue(this SerializedProperty property, object value)
    {
        switch (property.propertyType)
        {

            case SerializedPropertyType.AnimationCurve:
                property.animationCurveValue = value as AnimationCurve;
                break;

            case SerializedPropertyType.ArraySize:
                property.intValue = Convert.ToInt32(value);
                break;

            case SerializedPropertyType.Boolean:
                property.boolValue = Convert.ToBoolean(value);
                break;

            case SerializedPropertyType.Bounds:
                property.boundsValue = (value == null)
                        ? new Bounds()
                        : (Bounds)value;
                break;

            case SerializedPropertyType.Character:
                property.intValue = Convert.ToInt32(value);
                break;

            case SerializedPropertyType.Color:
                property.colorValue = (value == null)
                        ? new Color()
                        : (Color)value;
                break;

            case SerializedPropertyType.Float:
                property.floatValue = Convert.ToSingle(value);
                break;

            case SerializedPropertyType.Integer:
                property.intValue = Convert.ToInt32(value);
                break;

            case SerializedPropertyType.LayerMask:
                property.intValue = (value is LayerMask) ? ((LayerMask)value).value : Convert.ToInt32(value);
                break;

            case SerializedPropertyType.ObjectReference:
                property.objectReferenceValue = value as UnityEngine.Object;
                break;

            case SerializedPropertyType.Quaternion:
                property.quaternionValue = (value == null)
                        ? Quaternion.identity
                        : (Quaternion)value;
                break;

            case SerializedPropertyType.Rect:
                property.rectValue = (value == null)
                        ? new Rect()
                        : (Rect)value;
                break;

            case SerializedPropertyType.String:
                property.stringValue = value as string;
                break;

            case SerializedPropertyType.Vector2:
                property.vector2Value = (value == null)
                        ? Vector2.zero
                        : (Vector2)value;
                break;

            case SerializedPropertyType.Vector3:
                property.vector3Value = (value == null)
                        ? Vector3.zero
                        : (Vector3)value;
                break;

            case SerializedPropertyType.Vector4:
                property.vector4Value = (value == null)
                        ? Vector4.zero
                        : (Vector4)value;
                break;

        }
    }
}
