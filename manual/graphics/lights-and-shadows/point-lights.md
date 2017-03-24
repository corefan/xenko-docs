# Point lights

A point light emits light in all directions within a sphere.

![media/PointLightOverview.png](media/PointLightOverview.png) 

In the studio, the point light appears with the following icon:

![media/PointLight.png](media/PointLight.png) 

Once selected, the point light gizmo displays its sphere influence:

![media/PointLightSelected.png](media/PointLightSelected.png)

## Properties

![media/PointLightProperties.png](media/PointLightProperties.png) 

| Property            | Description                                                                                                                                         |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Color               | The color of the point light. Currently, the light supports an RGB color. Future versions of Xenko will also support temperature colors                      |
| Radius              | The sphere influence radius in meters. Above the range distance, the light doesn't affect models                                           |
| Shadow             | <br>**Type**: CubeMap is more accurate but slower. DualParaboloid is less accurate but faster</br> <br> **Filter:** Lets you produce soft shadows instead of hard shadows. Currently, the implemented technique is PCF (Percentage Closer Filtering). Other techniques will be available in future versions of Xenko.</br> <br>**Size:** The size of the shadow map texture. Values are **extra large**, **large**, **medium**, **small** and **extra small**. The value defaults to **small**. See [shadow map atlas size calculation](shadow-optimization.md) for details</br>     |          
| Bias Parameters     | These parameters are used to avoid some artifacts of the shadow map technique. <br>**Depth Bias:** The amount of depth to add to the sampling depth to avoid shadow acne.</br> <br>**Normal Offset Scale**:</br> A factor multiplied by the depth bias toward the normal </br>                                                                   |
| Intensity           | The intensity of the light. The color is multiplied by this value before being sent to the shader. Note: Currently, this value has no units. This will change in future versions |
| Culling Mask        | Defines which entity groups are affected by this light. By default, all groups are affected.                                                        |