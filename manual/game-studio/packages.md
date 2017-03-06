# Packages

Xenko organizes project files into **packages**. Each package comprises several folders and an *.xkpkg file which describes the package. 

A project can contain one package or several. You can share packages between projects.

## Package folder structure

![Folder structure](media/folder-structure.png)

* **Assets** contains the [asset](assets.md) files which represent elements in your game.

* **Bin** contains the compiled binaries and data. Xenko creates the folder when you build the project, with a subdirectory for each platform.

* **MyGame.Game** contains the source code of your game as a cross-platform Visual Studio project (.csproj). You can add multiple projects to the same game.

*	**MyGame.Platform** contains additional code for the platforms your project supports. Game Studio creates folders for each platform (eg *MyPackage.Windows*, *MyPackage.Linux*, etc). These folders are usually small, and only contain the entry point of the program.

* **obj** contains cached files. Game Studio creates this folder when you build your project.

* **Resources** is a suggested location for files such as images and audio files used by your assets.