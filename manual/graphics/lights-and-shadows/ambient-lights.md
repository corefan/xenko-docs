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
| Color        | The color of the light. Note: Currently, the light supports an RGB color. Future versions of Xenko will also support temperature colors |
| Intensity    | The intensity of the light. Note that currently, this value has no units                                                          |
| Culling Mask | Defines which entity groups are affected by the light. By default, all groups are affected.                                                                                                   |