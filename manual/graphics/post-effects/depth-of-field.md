# Depth of field

**Depth of field** effects simulate the behavior of a real camera lens focusing an object. 

By default, rendering produces a very sharp image, which can look artificial. In movies it's common to have the camera focus a specific object of the scene, leaving the background and foreground objects blurred and out of focus.

![media/realworld_dof_agave_flowers.jpg](media/realworld_dof_agave_flowers.jpg) 

Xenko achieves the effect by creating several versions of the original image, with different intensities of blur and interpolate between them. The more layers used, the better the quality, but at some performance cost. 

![media/depth-of-field-2.png](media/depth-of-field-2.png) 

## Properties


| Property   | Description                                                                                                                                                            |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Size       | Size of the bokeh, expressed as a factor of the image width so it is resolution-independent. The bigger the size, the worse the performance.                                                                   |
|            |                                                                                                                                                                        |
|            |                                                                                                                  |
| DOF Areas  | Areas of the depth of field. There are three main zones defined by their distance from the camera:                                                                         |
|            |                                                                                                                                                                        |
|            | - near out-of-focus area, from X to Y                                                                                                                                  |
|            | - in-focus area, from Y to Z                                                                                                                                           |
|            | - far out-of-focus area, from Z to W                                                                                                                                   |
|            |                                                                                                                                                                        |
|            | *In the future we plan to support physical parameters for the camera (aperture, focal length) so this area settings will be replaced by the lens physical attributes.* |
| Technique  | The technique affects both the performance and the shape of the bokeh.                                                                                                 |
|            |                                                                                                                                                                        |
|            | - **Circular Gaussian**: circular shape, fast, but unrealistic                                                                                                         |
|            |                                                                                                                                                                        |
|            |   ![media/depth-of-field-3.png](media/depth-of-field-3.png)                                                                                                          |
|            | - **Hexagonal Triple Rhombi**: hexagonal shape, heavier than Gaussian                                                                                                  |
|            |                                                                                                                                                                        |
|            |   ![media/depth-of-field-4.png](media/depth-of-field-4.png)                                                                                                          |
|            | - **Hexagonal McIntosh**: hexagonal shape, can be more expensive than **Hexagonal Triple Rhombi**                                                                      |
|            |                                                                                                                                                                        |
|            |   ![media/depth-of-field-5.png](media/depth-of-field-5.png)                                                                                                          |
|            |                                                                                                                                                                        |
|            |                                                                                                                                                                        |
|            |                                                                                                                                                                        |
|            |                                                                                                                                                                        |
| Auto Focus | When enabled, the DOF Areas are automatically updated so that the camera focuses on the object at the center of the screen.                                            |


## See also

* [Bloom](bloom.md)
* [Bright filter](bright-filter.md)
* [Color transforms](color-transforms/index.md)
* [Lens flare](lens-flare.md)
* [Light streaks](light-streaks.md)
* [Post-effects for developers](post-effects-for-developers.md)