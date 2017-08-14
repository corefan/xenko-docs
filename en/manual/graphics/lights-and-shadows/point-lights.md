# Point lights

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Designer</span>
<span class="label label-doc-audience">Artist</span>

**Point lights** emit light in all directions within a sphere. They're useful for simulating sources of local light, such as lamps and lightbulbs. They cast shadows.

![media/PointLightOverview.png](media/PointLightOverview.png) 

The scene editor shows the position of point lights with the following icon:

![media/PointLight.png](media/PointLight.png) 

Once selected, the point light gizmo displays the sphere in which it projects light:

![media/PointLightSelected.png](media/PointLightSelected.png)

## Properties

![media/PointLightProperties.png](media/PointLightProperties.png) 

| Property            | Description                                                        
| ------------------- | ------------------ 
| Color               | The color of the light (RGB)
| Radius              | The sphere influence radius in [world units](../../game-studio/world-units.md). Beyond this range, the light doesn't affect models
| Shadow             | <br>If shadows are enabled, the light casts shadows.</br><br> **Filter:** Produces soft shadows instead of hard shadows via PCF (Percentage Closer Filtering) </br> <br>**Size:** The size of texture to use for shadowing mapping. Larger textures produce better shadows edges, but are much more costly. For more information, see [Shadows](shadows.md)</br>
| Bias Parameters     | <br>These parameters are used to avoid some artifacts of the shadow map technique.</br> <br>**Depth Bias:** The amount of depth to add to the sampling depth to avoid shadow acne</br> <br>**Normal Offset Scale**: A factor multiplied by the depth bias toward the normal </br>
| Intensity           | The intensity of the light. The color is multiplied by this value before being sent to the shader. Note: negative values produce darkness and have unpredictable effects
| Culling Mask        | Which entity groups are affected by this light. By default, all groups are affected

## See also

* [Add a light](add-a-light.md)
* [Point lights](point-lights.md)
* [Ambient lights](ambient-lights.md)
* [Skybox lights](skybox-lights.md)
* [Spot lights](spot-lights.md)
* [Light probes](light-probes.md)
* [Shadows](shadows.md)