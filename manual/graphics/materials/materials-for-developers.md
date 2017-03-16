# Materials for developers

This diagram shows the Material interfaces and implementation classes:

![media/materials-for-developers-1.png](media/materials-for-developers-1.png) 

- The interface @'SiliconStudio.Xenko.Rendering.Materials.IMaterialDescriptor' is the root interface for a material description.
- The @'SiliconStudio.Xenko.Rendering.Materials.IMaterialShaderGenerator' is the main interface used to generate a material shader of the material.
- Each attributes and layers are implementing this interface to modify the final material shader.
- The @'SiliconStudio.Xenko.Rendering.Materials.MaterialDescriptor' is the editor-time description of the material before being compiled into a Material Shader.
- The @'SiliconStudio.Xenko.Rendering.Material' class is the runtime material shader generated from the @'SiliconStudio.Xenko.Rendering.Materials.MaterialDescriptor'

## In this section

- [Material colors](material-colors.md)
- [Material attributes](material-attributes.md)
- [Material layers](material-layers.md)