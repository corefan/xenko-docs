# Platforms

<div class="doc-incomplete"/>

![Platforms](media/game-engine-system-requirements-intro-pic.png)

Xenko is cross-platform game engine. This means you can create your game once, then compile and deploy it on all the platforms Xenko supports. The engine converts C# and shaders to the different native languages, and abstracts the concepts that differ between platforms, so you don't have to adapt your code for each platform.

## Supported platforms

* Windows Desktop 7, 8, 10
* Windows Universal (UWP)
* [Linux (Ubuntu)](linux/index.md)
* Android 2.3 and later
* iOS 8.0 and later

> [!TIP]
> To check which graphics platform your project is using, add a break point to your code (eg in a script), run the project, and check the [Platform.Type](xref:SiliconStudio.Core.Platform.Type) variable.

## Supported graphics platforms

* DirectX 9, 10, 11, 12
* OpenGL 3, 4
* OpenGL ES 2, 3
* Vulkan

> [!TIP]
> To check which graphics platform your project is using, add a break point to your code (eg in a script), run the project, and check the value of the [GraphicsDevice.Platform](xref:SiliconStudio.Xenko.Graphics.GraphicsDevice.Platform) variable.

## Preprocessor variables

Xenko defines preprocessor variables if you want to write code that compiles only under a specific platform. For more information, see [Preprocessor variables](../scripts/preprocessor-variables.md).

## In this section

* [Linux](linux/index.md)
* [UWP](uwp/index.md)
    * [Xbox Live](uwp/xbox-live.md)
* [Add or remove a platform](add-or-remove-a-platform.md)
* [Change the graphics platform](change-the-graphics-platform.md)