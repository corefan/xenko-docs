# Streaming

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Artist</span>
<span class="label label-doc-audience">Programmer</span>

>[!Note]
>Currently, only textures can be streamed.

As games typically contain lots of textures, Xenko often can't load every texture simultaneously due to GPU and CPU memory limitations. For this reason, it's better to **stream** textures, so they load only when they're needed. This also means games load significantly faster.

As soon as the texture is needed at runtime, Xenko loads a low-quality version, then rapidly upscales its quality. The gif below shows this process happening in slow motion; in most situations on most hardware, streaming is much faster.

![Texture loading](media/loading-texture.gif)

When the texture is no longer needed, Xenko downscales the texture quality and then unloads it.

## When to use streaming

Streaming is enabled by default for all textures. You might want to disable streaming on important textures you always want to load in high quality, such as:

* [splash screens](../../game-studio/splash-screen.md)

* textures on player characters

* textures used in [particles](../../particles/index.md) (particles often have a short lifespan, so might disappear before the texture fully loads)

Currently, there's no way to stream resources differently based on distance from the camera. Xenko always streams them to the highest quality.

## Enable or disable streaming on a texture

 1. In the **asset view**, select the texture.

    ![Select normal map texture](media/select-texture.png)

2. In the **property grid**, under **Format**, enable or disable the **Stream** checkbox.

    ![Enable streaming](media/enable-streaming.png)

### Disable streaming for a single texture in code

Use:

```cs
((Game)Game).Streaming.StreamResourcesFully(myTexture);
```

## When Xenko streams textures

When streaming is enabled, Xenko doesn't load textures until: 

* they're rendered in the scene, or

* you indicate an actual use in a script, eg:

    ```cs
    var texture = Content.Load<Texture>("myTexture", ContentManagerLoaderSettings.StreamingDisabled);
    ```

## Disable all texture streaming

To override all texture settings and disable streaming globally, use:

```cs
((Game)Game).Streaming.DisableStreaming = true;
```

## StreamingManager API

To change streaming settings such as the lifespan of streamed textures or streaming efficiency, see the [StreamingManager API](xref:SiliconStudio.Xenko.Streaming.StreamingManager).

## See also

* [StreamingManager API](xref:SiliconStudio.Xenko.Streaming.StreamingManager)
* [Textures index](index.md)
* [Texture compression](compression.md)