# Skyboxes
<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Designer</span>
<span class="label label-doc-audience">Programmer</span>

**Skyboxes** are backgrounds that create the illusion of space and distance. Typical skybox backgrounds include skies, clouds, mountains, and other scenery.

To create a skybox, Xenko encloses the scene in a cube and maps a texture, called a **cubemap**, on the cube's inner faces. This simulates three-dimensional surroundings that appear spacious. Skyboxes are pre-rendered, so require little GPU and CPU. You can also [use skyboxes to light a scene](lights-and-shadows/skybox-lights.md).

![Distant planet skybox](media/skybox-disassembled.png)

![Merged skybox](media/skybox-assembled.png)

> [!Note]
> Currently, Xenko doesn't support skydomes.

## Cubemaps

Cubemaps are composed of six images, one for each face of the skybox cube. Xenko uses cubemaps with the extension `.dds`.

Currently, Game Studio can't convert image files to `.dds` files. Use another application to create a cubemap from separate image files, such as:

* [Nvidia conversion tool](https://developer.nvidia.com/nvidia-texture-tools-adobe-photoshop)
* [ATI conversion tool](http://developer.amd.com/tools-and-sdks/archive/games-cgi/cubemapgen)

### Add a cubemap asset to a project

* In the **Asset view**, click ![](media/engine-skybox-add-new-asset-button.png), select **Textures** > **Texture**, and browse to the `.dds` file.

    ![Select texture as asset type](media/engine-skybox-select-asset-type.png)

* Alternatively, drag and drop a `.dds` file from **Windows Explorer** to the **Asset view**, then select **Texture**.

    ![Drag and drop background texture](media/engine-skybox-drag-and-drop-background-texture.gif)

The cubemap is now available as an asset in your project. You can use the cubemap asset in your skybox asset.

## Add a skybox asset to a project

1. In the **Asset view**, click ![Add new asset](media/engine-skybox-add-new-asset-button.png)

2. Select **Miscellaneous**, and choose **Skybox**.

    ![Choose asset type](media/engine-skybox-choose-asset-type.png)

    The **Asset picker** opens.

3. Choose a skybox texture (`.dds` file) from the project assets and click **OK**.
    
    ![Choose texture](media/engine-skybox-select-skybox-texture.png)

The skybox asset properties affect how the skybox lights the scene. For information about these properties, see [Skybox lights](lights-and-shadows/skybox-lights.md).

## Add a skybox component to an entity

Xenko includes an entity with a [Skybox component](xref:SiliconStudio.Xenko.Engine.SkyboxComponent) in the project by default. Only one skybox can be active in a scene at a time. If there are multiple skyboxes, Xenko loads the first only.

You can add [Skybox components](xref:SiliconStudio.Xenko.Engine.SkyboxComponent) to as many entities as you need. You might want to include more than one skybox, for example, if you want to switch between them at runtime.

To add a [Skybox component](xref:SiliconStudio.Xenko.Engine.SkyboxComponent) to an entity:

1. In the **Scene view**, select the entity you want to add the component to.

    This can be an empty entity. Its position in the scene doesn't matter.

2. In the **Property grid**, click **Add component** and select **Skybox component**.

    ![Add skybox component](media/engine-skybox-add-skybox-component.png)

3. Specify the **skybox asset** you want to use.

    ![Skybox component properties](media/engine-skybox-skybox-components-properties.png)

You can modify the following [Skybox component](xref:SiliconStudio.Xenko.Engine.SkyboxComponent) settings:

* [Background](xref:SiliconStudio.Xenko.Engine.SkyboxComponent.Background): how to display the skybox.
* [Intensity](xref:SiliconStudio.Xenko.Engine.SkyboxComponent.Intensity): the skybox background radiation intensity, from 0 (none) to 100 (maximum).

## Use a skybox as a light source

You can set the skybox as the light type in a [Light component](xref:SiliconStudio.Xenko.Engine.LightComponent). Xenko analyzes the skybox and generates lighting using [image-based lighting (Wikipedia)](https://en.wikipedia.org/wiki/Image-based_lighting).

For more information, see [Skybox lights](lights-and-shadows/skybox-lights.md).

## Example code

```cs
public Skybox skybox;
public void ChangeSkyboxParameters()
{
    //Add a Skybox component to an entity:
    var skyboxComponent = Entity.Get<SkyboxComponent>();

    //Replace the existing skybox:
    skyboxComponent.Skybox = skybox;
    
    //Change the skybox light intensity:
    skyboxComponent.Intensity = 1.5f;

    //Change the skybox background to Color:
    skyboxComponent.Background = SkyboxBackground.Color;
}
```

## See also
* [Skybox lights](lights-and-shadows/skybox-lights.md)
* [Lighting and shadows](lights-and-shadows/index.md)