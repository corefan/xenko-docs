# Spot lights

A **spot light** produces a cone of light positioned in space oriented to a specific direction.

![media/SpotLightOverview.png](media/SpotLightOverview.png) 

Game Studio represents the spot light with the following icon:

![media/SpotLight.png](media/SpotLight.png) 

Once selected, the gizmo of the spot light displays its main direction, range and the outer cone:

![media/SpotLightSelected.png](media/SpotLightSelected.png) 

## Properties

Properties that defines a spot light:

![media/SpotLightProperties.png](media/SpotLightProperties.png) 

| Property            | Description                                                                                                                                                           |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Type                | Spot                                                                                                                                                                  |
| Color               | The color of this spot light                                                                                                                                          |
|                     |                                                                                                                                                                       |
|                     | Note: Currently, the light supports an RGB color. Future versions of Xenko will also support temperature colors.                                                                            |
| Range               | The range distance in meters. Above the range distance, the light doesn't affect models                                                                               |
| Angle Inner         | The inner angle of the spot cone where the light intensity influence is at one                                                                                        |
| Angle Outer         | The outer angle of the spot cone where the light intensity influence is zero                                                                                          |
| Shadows             | All shadows properties are detailed below                                                                                                                             |
| Filter              | Filtering allows to produce **soft shadows** instead of **hard shadows**. Currently, the implemented technique is PCF (Percentage Closer Filtering)                   |
|                     |                                                                                                                                                                       |
|                     | Note: More techniques will be added in future versions.                                                                                                                                |
| Size                | The size of the shadow map texture. Values are **extra large**, **large**, **medium**, **small** and **extra small**.                                                 |
|                     | See [shadow map atlas size calculation](shadow-optimization.md) for details.                                                                                        |
|                     |                                                                                                                                                                       |
|                     |  For a spot light, this value is by default **medium**, as a spot light has usually a medium visual impact.                                                           |
| Bias Parameters     | These parameters are used to avoid some artifacts of the shadow map technique                                                                                         |
| Depth Bias          | The amount of depth to add to the sampling depth to avoid the phenomenon of shadow acne.                                                                              |
| Normal Offset Scale | A factor multiplied by the depth bias toward the normal                                                                                                               |
| Intensity           | The intensity of this light. The color is basically multiplied by this value before sending the color to the shader                                                   |
|                     |                                                                                                                                                                       |
|                     | Note: Currently, this value has no units. This will change in future versions.                                                                                        |
| Culling Mask        | Defines which entity groups are affected by this light. By default, all groups are affected.                                                                          |


 

 

