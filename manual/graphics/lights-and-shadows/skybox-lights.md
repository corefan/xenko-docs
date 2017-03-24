# Skybox lights

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Designer</span>
<span class="label label-doc-audience">Programmer</span>

A skybox light is an [ambient light](ambient-lights.md) emitted by a [skybox](../skyboxes.md).  Xenko analyzes the skybox cubemap and generates lighting using [image-based lighting (Wikipedia)](https://en.wikipedia.org/wiki/Image-based_lighting).

![media/SkyboxLightOverview.png](media/SkyboxLightOverview.png) 

To use a skybox light, an entity must have both:

* a [Light component](xref:SiliconStudio.Xenko.Engine.LightComponent) of type **Skybox**
* a [Skybox component](xref:SiliconStudio.Xenko.Engine.SkyboxComponent)

## How skyboxes light the scene

These images show the difference between ambient and skybox lighting on two pure diffuse [materials](../materials/index.md):

| Ambient lighting                                     | Skybox lighting     
| ---------------------------------------------------- | -------------------------------
| ![Ambient lighting](media/AmbientLight.png)  | ![Skybox lighting.png](media/SkyboxLight-MaterialPureDiffuse.png)  |                                                           |                        
These images show the effect of skybox lighting on a material with different metal and gloss properties:

| Material Plastic    | Metal 100% Gloss 50%                                                                                    | Metal 100% Gloss 100%                                                                                      |
----------------------------------------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
 ![Material plastic](media/SkyboxLight-MaterialPlastic.png)  | ![Material 100% Gloss 100%](media/SkyboxLight-MaterialMetal100Gloss50.png)  | ![Metal 100% Gloss 100%](media/SkyboxLight-MaterialMetal100Gloss100.png)  |

Notice how the skybox texture colours are reflected.

## Set up a skybox light

To set up a skybox light, you first need a skybox asset and an entity with a [Skybox component](xref:SiliconStudio.Xenko.Engine.SkyboxComponent). For information about how to add these, see the [Skybox](../skyboxes.md) page.

1. Select the entity that has the [Skybox component](xref:SiliconStudio.Xenko.Engine.SkyboxComponent).

2. In the entity **Properties grid**, click **Add component** and select [Light](xref:SiliconStudio.Xenko.Engine.LightComponent).

    ![Skybox component properties](media/skybox-add-light-component.png)

3. In the **Light** component properties, under **Usage**, select **Skybox**.

    ![Light component property](media/light-component-property.png)

The [Light componenet](xref:SiliconStudio.Xenko.Engine.LightComponent) uses the skybox asset to light the scene.

## Skybox asset properties

The skybox asset properties affect how the skybox lights the scene.

When you use a skybox as a light, Xenko uses it both in compressed form ([spherical harmonics (Wikipedia)](https://en.wikipedia.org/wiki/Spherical_harmonics)), and as a texture, to light different kinds of material. In the **Properties grid**, you can control the detail of both.

![Skybox lighting properties](media/skybox-lighting-and-background.png)

| Property     | Description                                                                                                                                                                                    |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Cube Map |  The cubemap asset used for the skybox. 
| Usage        |  Specify whether the skybox is visible at runtime (**Lighting and Background**) or only used for lighting (**Lighting**). Note that the **Background** option is deprecated and will be removed in a future release.
| Diffuse SH Order  | The level of detail of the compressed skybox, used for diffuse lighting (dull materials). `Order5` is more detailed than `Order3`. |
| Specular Cubemap Size | The texture size used for specular lighting (shiny materials). Larger textures have more detail. |

## Skybox light properties

![media/SkyboxLightProperties.png](media/SkyboxLightProperties.png) 

| Property     | Description   |
| ------------ | --------------|
| Type         | Skybox                                                                                                                                                                                         |
| Intensity    | The light intensity. The value has no units, as it is dependent on the Skybox component values (see the note below). |
| Culling Mask | Which entity groups are affected by the light. By default, all groups are affected.                                                                                                   |

>[!Note]
>The **Intensity** properties in the Skybox and Light components are linked. To calculate the Light component [intensity](xref:SiliconStudio.Xenko.Engine.LightComponent.Intensity), Xenko multiplies it by the Skybox component [intensity](xref:SiliconStudio.Xenko.Engine.SkyboxComponent.Intensity). The final color is defined as: `final Color = Skybox Sampler Color * Light Skybox Intensity * Skybox Intensity`

## See also

* [Skyboxes](../skyboxes.md)