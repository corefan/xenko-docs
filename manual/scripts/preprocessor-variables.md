# Preprocessor variables

<span class="label label-doc-level">Advanced</span>
<span class="label label-doc-audience">Programmer</span>

If you need different code depending on the platforms and the graphics APIs, you can use various preprocessor variables in scripts.

> [!WARNING]
> Using [Platform.Type](xref:SiliconStudio.Core.Platform.Type) and 
> [GraphicsDevice.Platform](xref:SiliconStudio.Xenko.Graphics.GraphicsDevice.Platform) rather than 
> preprocessor variables is recommended when possible. It avoids you to forget to update code 
> for a specific platform after modification (the code is always compiled for all platforms).

## Platforms

| Variable                               | Value                          |
| -------------------------------------- | ------------------------------ |
| SILICONSTUDIO_PLATFORM_WINDOWS         | Windows (standard and RT)      |
| SILICONSTUDIO_PLATFORM_WINDOWS_DESKTOP | Windows (non-RT)               |
| SILICONSTUDIO_PLATFORM_WINDOWS_RT      | Windows RT                     |
| SILICONSTUDIO_PLATFORM_WINDOWS_PHONE   | Windows Phone                  |
| SILICONSTUDIO_PLATFORM_MONO_MOBILE     | Xamarin.iOS or Xamarin.Android |
| SILICONSTUDIO_PLATFORM_ANDROID         | Xamarin.Android                |
| SILICONSTUDIO_PLATFORM_IOS             | Xamarin.iOS                    |

## Graphics APIs

| Variable                                      | Value                 |
| --------------------------------------------- | --------------------- |
| SILICONSTUDIO_XENKO_GRAPHICS_API_DIRECT3D   | Direct3D 11           |
| SILICONSTUDIO_XENKO_GRAPHICS_API_OPENGL     | OpenGL (Core and ES)  |
| SILICONSTUDIO_XENKO_GRAPHICS_API_OPENGLCORE | OpenGL Core (Desktop) |
| SILICONSTUDIO_XENKO_GRAPHICS_API_OPENGLES   | OpenGL ES             |
| SILICONSTUDIO_XENKO_GRAPHICS_API_VULKAN     | Vulkan                |

## Example

```cs
#if SILICONSTUDIO_PLATFORM_WINDOWS
    // Windows specific code goes here...
#elif SILICONSTUDIO_PLATFORM_MONO_MOBILE
    // iOS and Android specific code goes here...
#else
    // Other platforms code goes here...
#endif
```

## See also

* [Create a script](create-a-script.md)
* [Types of script](types-of-script.md)
* [Public properties and fields](public-properties-and-fields.md)
* [Scheduling and priorities](scheduling-and-priorities.md)
* [Add a script](add-a-script.md)
* [Create a script](create-a-script.md)
* [Debugging](debugging.md)