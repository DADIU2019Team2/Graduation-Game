﻿using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;
using UnityEngine.SceneManagement;
using System.IO;

public class SaveLoad
{
    public static GameSave saveGame = new GameSave();

    public static void Save()
    {
        GameSave.currentSave.lastCompletedLevel = SceneManager.GetActiveScene().buildIndex;
        Debug.Log("SAVING");
        saveGame = GameSave.currentSave;
        BinaryFormatter bf = new BinaryFormatter();
        FileStream file = File.Create(Application.persistentDataPath + "/savedGames.gd");
        Debug.Log(Application.persistentDataPath.ToString());
        bf.Serialize(file, SaveLoad.saveGame);
        file.Close();
    }
    public static void Load()
    {
        if (File.Exists(Application.persistentDataPath + "/savedGames.gd"))
        {
            BinaryFormatter bf = new BinaryFormatter();
            FileStream file = File.Open(Application.persistentDataPath + "/savedGames.gd", FileMode.Open);
            SaveLoad.saveGame = (GameSave)bf.Deserialize(file);
            GameSave.currentSave = SaveLoad.saveGame;
            file.Close();
        }
        else
        {
            Debug.Log("Doest not exist");
        }
            GameSave.currentSave = saveGame;
    }

}
