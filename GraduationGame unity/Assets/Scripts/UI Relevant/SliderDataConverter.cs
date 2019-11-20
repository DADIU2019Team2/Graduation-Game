using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using TMPro;

[RequireComponent(typeof(Slider))]
public class SliderDataConverter : MonoBehaviour
{
    private enum DataSaveType { GlobalData, SceneSpecificData};
    [SerializeField] private DataSaveType saveType;

    [Tooltip("Choose only one of these displaytexts")]
    [SerializeField] private Text displayTextNormal;

    [Tooltip("Choose only one of these displaytexts")]
    [SerializeField] private TextMeshProUGUI displayTextPro;
    private Slider slider;
    private bool isIntSLider;

    [SerializeField] private FloatVariable floatDataContainer;
    public enum SpecificVolumeType { Master, Music, SFX}
    public SpecificVolumeType specificVolumeToChange;

    private void Awake()
    {
        slider = transform.GetComponent<Slider>();
        if(displayTextNormal != null || displayTextPro != null)
        {
            slider.onValueChanged.AddListener(delegate { displayData(); });
        }
    }

    public void Start()
    {
        isIntSLider = slider.wholeNumbers;

        if(saveType.Equals(DataSaveType.GlobalData))
            slider.value = floatDataContainer.getValue();

        slider.onValueChanged.AddListener(delegate { updateData(); });

    }

    private void updateData()
    {
        floatDataContainer.setValue(slider.value);
        SetSpecificVolumeType(specificVolumeToChange);
    }

    private void displayData()
    {
        if(displayTextNormal != null)
        {
            displayTextNormal.text = slider.value.ToString();
        }
        if(displayTextPro != null)
        {
            displayTextPro.text = slider.value.ToString();
        }
    }

    void SetSpecificVolumeType(SpecificVolumeType Vtype)
    {

        switch (specificVolumeToChange)
        {
            case SpecificVolumeType.Master:
                float masterVolume = slider.value;
                AkSoundEngine.SetRTPCValue("Master_Volume", masterVolume);
                break;
            case SpecificVolumeType.Music:
                float musicVolume = slider.value;
                AkSoundEngine.SetRTPCValue("Music_Volume", musicVolume);
                break;
            case SpecificVolumeType.SFX:
                float SFXVolume = slider.value;
                AkSoundEngine.SetRTPCValue("SFX_Volume", SFXVolume);
                break;
            default:
                break;
        }
    }
}
