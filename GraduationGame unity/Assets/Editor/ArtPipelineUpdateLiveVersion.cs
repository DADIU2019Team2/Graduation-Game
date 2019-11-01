using UnityEngine;
using UnityEditor;
using System.IO;
using System.Collections;
using System.Collections.Generic;

public class ArtPipelineUpdateLiveVersion : MonoBehaviour
{
    static string folderNameToFind = "live";
    
    [MenuItem("3D art team/Update Live")]
    static void updateLive()
    {
        //List<string> liveFolders = new List<string>();
        string artPath = Directory.GetCurrentDirectory() + @"\3DAssets";
        Debug.Log("Looking through: " + artPath + " and all its subfolders");
        string[] listOfSubDirs = Directory.GetDirectories(artPath);
        int amountOfSubfolders = listOfSubDirs.Length;
        //Debug.Log("Amount of directories = " + amountOfSubfolders);
        string RelocationPath = Application.dataPath; // path to Assets folder

        DirectoryCopy(artPath, RelocationPath, true);

        //getAllLiveFolders(artPath, liveFolders);
        //printListContent(liveFolders);

        //moveLiveModels(liveFolders);
        Debug.Log("i've updated the Live versions of all models");
    }

    static List<string> getAllLiveFolders(string rootDirPath, List<string> listOfLive)
    {

        string[] allSubFolders = Directory.GetDirectories(rootDirPath);
        //Debug.Log("I find these subfolders: ");
        /*for (int i = 0; i < allSubFolders.Length; i++)
        {
            Debug.Log(allSubFolders[i]);
        }*/
        string[] LiveArray = Directory.GetDirectories(rootDirPath, folderNameToFind);
        /*for (int i = 0; i < LiveArray.Length; i++)
        {
            Debug.Log("Live array contains: " + LiveArray[i]);
        }*/
        foreach (string liveFolder in LiveArray)
        {
            listOfLive.Add(liveFolder);
        }
        foreach (string folder in allSubFolders)
        {
            getAllLiveFolders(folder, listOfLive);
        }
                
        //Debug.Log("Amount of live folders found: " + listOfLive.Count);
        return listOfLive;
    }

    static void printListContent(List<string> list)
    {
        //Debug.Log("list " + list + " Contains:");
        foreach (string str in list)
        {
            //Debug.Log(str);
            //Debug.Log("Type of model: " + Path.GetFullPath(Path.Combine(str, @"..\..\")));
        }
        //Debug.Log(Directory.GetCurrentDirectory() + @"\Assets\Models");
    }

    static void moveLiveModels(List<string> _liveFolders)
    {
        string targetRootPlacement = Directory.GetCurrentDirectory() + @"\Assets\Models";

        List<string> typeOfModel = new List<string>();
        //create folders for types of models if folder is not already created
        foreach (string str in _liveFolders)
        {
            //gets name of the folder that controls the type of model
            string typeFolderName = Path.GetFileName(Path.GetDirectoryName(
                Path.GetFullPath(Path.Combine(str, @"..\..\"))));
            //Debug.Log("Type folder "+ typeFolderName);

            //create type folder if it does not exist 
            string targetPath = targetRootPlacement + @"\" + typeFolderName;
            Directory.CreateDirectory(targetPath);

            //copies the folderstructure of the 3D guys and puts it in models but only the FBX and PNG files 
            //gets copied and thus some of the folders in the structure is going to be empty
            string folderToCopy = Path.GetDirectoryName(Path.GetFullPath(Path.Combine(str, @"..\..\")));
            DirectoryCopy(folderToCopy, targetPath, true);
            /*
            //put fbx files from live folders into the correct type folder
            string[] fbxFilePath = Directory.GetFiles(str, "*.fbx");
            //Debug.Log("I found this amount of FBX files: " + fbxFilePath.Length + "File is called: " + fbxFilePath[0]);
            string fileName = Path.GetFileName(fbxFilePath[0]);
            //Debug.Log("Filename is: " + fileName);
            string newFilePath = targetPath + @"\" + fileName;
            //Debug.Log("Target Path = "+newFilePath);
            File.Copy(fbxFilePath[0], newFilePath , true);
            */
        }
        
    }

    private static void DirectoryCopy(string sourceDirName, string destDirName, bool copySubDirs)
    {
        // Get the subdirectories for the specified directory.
        DirectoryInfo dir = new DirectoryInfo(sourceDirName);

        if (!dir.Exists)
        {
            throw new DirectoryNotFoundException(
                "Source directory does not exist or could not be found: "
                + sourceDirName);
        }

        DirectoryInfo[] dirs = dir.GetDirectories();
        // If the destination directory doesn't exist, create it.
        if (!Directory.Exists(destDirName))
        {
            Directory.CreateDirectory(destDirName);
        }

        // Get the FBX files in the directory and copy them to the new location.
        FileInfo[] FBXfiles = dir.GetFiles("*.fbx");
        foreach (FileInfo fbx in FBXfiles)
        {
            string temppath = Path.Combine(destDirName, fbx.Name);
            fbx.CopyTo(temppath, true);
        }
        // Get the PNG files in the directory and copy them to the new location.
        FileInfo[] PNGfiles = dir.GetFiles("*.png");
        foreach (FileInfo png in PNGfiles)
        {
            string temppath = Path.Combine(destDirName, png.Name);
            png.CopyTo(temppath, true);
        }

        // If copying subdirectories, copy them and their contents to new location.
        if (copySubDirs)
        {
            foreach (DirectoryInfo subdir in dirs)
            {
                string temppath = Path.Combine(destDirName, subdir.Name);
                DirectoryCopy(subdir.FullName, temppath, copySubDirs);
            }
        }
    }
}
