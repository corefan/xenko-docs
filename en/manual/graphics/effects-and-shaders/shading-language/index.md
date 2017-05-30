# Shading language

Xenko provides a superset of the [HLSL Shading language](http://msdn.microsoft.com/en-us/library/windows/desktop/bb509561%28v=vs.85%29.aspx), bringing advanced and higher level language constructions, with:

- **extensibility** to allow shaders to be extended easily using Object-Oriented-Programming concepts like class, inheritance, composition
- **modularity** to provide a set modular shaders each focusing on a single rendering technique, more easily manageable
- **reusability** to maximize code reuse between shaders

Xenko Shading Language is automatically transformed to an existing shading language (HLSL, GLSL, GLSL ES).

## In this section

- [Class inheritance](classes-mixins-and-inheritance.md)
- [Composition](composition.md)
- [Template](template.md)
- [Shader stage input/output automatic management](automatic-shader-stage-input-output.md)