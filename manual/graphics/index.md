# Graphics

This section explains how to use Game Studio and the Xenko API for graphics and rendering.

* [Lighting and shadows](lights-and-shadows/index.md)
* [Graphics Compositor](graphics-compositor/index.md)
* [Materials](materials/index.md)
* [Post-effects](post-effects/index.md)
* [Rendering pipeline](rendering-pipeline/index.md)
* [Low-level API](low-level-api/index.md)
* [Effects and shaders](effects-and-shaders/index.md)

## Shaders

Shaders are authored in the [Xenko's shading language](effects-and-shaders/shading-language/index.md), an extension of `HLSL`. They provide true composition of modular shaders through the use of [inheritance](effects-and-shaders/shading-language/classes-mixins-and-inheritance.md), shader [mixins](effects-and-shaders/shading-language/composition.md), and [automatic weaving of shader in-out attributes](effects-and-shaders/shading-language/automatic-shader-stage-input-output.md).

## Effects

[Effects](effects-and-shaders/effect-language.md) in Xenko use C#-like syntax to combine shaders. They provide conditional composition of shaders to generate effect permutations.

## Target everything

Xenko shaders are converted automatically to the target graphics platform, either plain HLSL for Direct3D, `GLSL` for OpenGL, or `SPIR-V` for Vulkan platforms.

## Advanced graphics

The Graphics module provides a set of methods to display the game. Although Xenko is available on multiple platforms, the whole system behaves like DirectX 11 from the user perspective. You need a basic knowledge of the rendering pipeline to use it.