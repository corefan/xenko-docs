# Material layers

You can combine multiple materials to build more complex materials. 

![media/material-layers-1.png](media/material-layers-1.png)  

This screenshot shows the blending of a rust material with a gold material:

![media/material-layers-2.png](media/material-layers-2.png) 

This diagram shows the definition of the materials blended in the screenshot above:

![media/material-layers-3.png](media/material-layers-3.png) 

| Property        | Description                                                                                                                              |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Material        | A reference to a material                                                                                                                |
| Blend Map       | A blend map [scalar provider](material-colors.md) that defines how much the current material is blend to the previous one (upper layer). |
|                 |                                                                                                                                          |
|                 | - A value of 0 means that the previous material in the layer is fully used                                                               |
|                 | - A value of 1 means that the material referenced by this layer is fully used                                                            |
|                 | - Values between 0 and 1 generate a blend of a parameters of the previous material with the material defined by this layer       |
|                 |                                                                                                                                          |
|                 |                                                                                                                                          |
| Layer Overrides |                                                                                                                                          |
| - UV Scale      | A UV scale applied to all textures UV of the material of the layer (excluding the occlusion map)                                         |
|                 |                                                                                                                                          |
|                 |                                                                                                                                          |

> [!Note] 
> Xenko blends individual layer attributes if they have the same shading model; otherwise, Xenko blends the shading model.    
