# Ambient lights

An ambient light is a uniform light with no direction.

![media/AmbientLightOverview.png](media/AmbientLightOverview.png) 

An example of an object lit uniformly:

| Ambient Lighting                                     |
| ---------------------------------------------------- |
| ![media/AmbientLight.png](media/AmbientLight.png)  |
|                                                      |
| Material Pure Diffuse                                |

## Properties

Ambient lights have the following properties:

![media/AmbientLightProperties.png](media/AmbientLightProperties.png) 

| Property     | Description                                                                                                                                                                                    |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Type         | Ambient                                                                                                                                                                                        |
| Color        | The color of this point light                                                                                                                                                                  |
|              |                                                                                                                                                                                                |
|              | Note: Currently, the light supports an RGB color. Future versions of Xenko will also support temperature colors.                                                                                             |
| Intensity    | The intensity of this light. The color sampled from the skybox is multiplied by this value and the intensity defined in the skybox component being sent to the shader. |
|              |                                                                                                                                                                                                |
|              | Hence the final color is defined as:                                                                                                                                                           |
|              |                                                                                                                                                                                                |
|              | `final Color = Skybox Sampler Color * Light Skybox Intensity * Skybox Intensity`                                                                                                               |
|              |                                                                                                                                                                                                |
|              | Note: Currently, this value has no units, as it's dependent on the values coming from the skybox.                                                                                            |
| Culling Mask | Defines which entity groups are affected by this light. By default, all groups are affected.                                                                                                   |


 

 

 

 

