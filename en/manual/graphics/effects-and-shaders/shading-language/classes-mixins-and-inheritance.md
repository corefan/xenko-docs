# Classes, mixins and inheritance

Xenko Shading Language (XKSL) is an extension of HLSL which makes it closer to C# syntax and concepts. The language is object-oriented:

- classes are the foundation of the code
- classes contain methods and members
- classes can be inherited, methods can be overridden
- member types can be classes

XKSL uses a original way to handle multiple inheritance. Inheritance is performed through mixins, so the order of inheritance is crucial:

- the order of inheritance defines the actual implementation of a method (the last override)
- if a mixin appears several times in the inheritance, only the first occurrence is taken into account (as well as its members and methods)
- it is possible to call the previous implementation of a method using `base.<method name>(<arguments>)`

## Keywords

XKSL uses the same set of keywords as HLSL but adds some new ones:

- `stage`: method and member keyword. This keyword ensures that the method or member is only defined once and is the same in the compositions.
- `stream`: member keyword. The member is accessible at every stage of the shader. For more information, see [Automatic shader stage input/out](automatic-shader-stage-input-output.md).
- `streams`: sort of global structure storing variables needed across several stages of the shader. For more information, see [Automatic shader stage input/out](automatic-shader-stage-input-output.md).
- `override`: method keyword. If this keyword is missing, the compilation returns an error.
- `abstract`: is used in front of a method declaration (without a body).
- `clone`: method keyword. When a method appears several times in the inheritance tree of class, this keyword forces the creation of multiple instances of the method at each level of the inheritance instead of one. For more information, see [Composition](composition.md).
- `Input`: for geometry and tessellation shaders. For more information, see [Shader stages](shader-stages.md).
- `Output`: for geometry and tessellation shaders. For more information, see [Shader stages](shader-stages.md).
- `Input2`: for tessellation shader. For more information, see [Shader stages](shader-stages.md).
- `Constants`: for tessellation shader. For more information, see [Shader stages](shader-stages.md).

## Abstract methods

Abstract methods are available in XKSL. They should be prefixed with the `abstract` keyword. You can inherit from a class with abstract methods without having to implement them; the compiler will simply produce a harmless warning. However, it should be implemented in your final shader to prevent a compilation error.

## Annotations

Like HLSL, annotations are available in XKSL. Here are some the most useful ones:

- `[Color]` for float4 variables. The ParameterKey will have the type `Color4` instead of `Vector4`. It also specifies to GameStudio that this variable should be treated as a color, giving you the most convenient interface to edit it.
- `[Link(...)]` specifies which ParameterKey to use to set this value. However, an independent default key is still created.
- `[Map(...)]` specifies which ParameterKey to use to set this value. No new ParameterKey is created.
- `[RenameLink]` prevents the creation of a ParameterKey. It should be used with `[Link()]`.

**Code:** Annotations

```cs
class BaseClass
{
	[Color] float4 myColor;
 
	[Link("ProjectKeys.MyTextureKey")]
	[RenameLink]
	Texture2D texture;
 
	[Map("Texturing.Texture0")] Texture2D defaultTexture;
};
```

## Inheritance example

**Code:** Example of inheritance

```cs
class BaseInterface
{
	abstract float Compute();
};
 
class BaseClass : BaseInterface
{
	float Compute()
	{
		return 1.0f;
	}
};
 
class ClassA : BaseClass
{
	override void Compute()
	{
		return 2.0f;
	}
};
 
class ClassB : BaseClass
{
	override void Compute()
	{
		float prevValue = base.Compute();
		return (5.0f + prevValue);
	}
};
```

Now let's look at what happens when we change the inheritance order between `ClassA` and `ClassB`.

**Code:** Importance of inheritance order

```cs
class MixAB : ClassA, ClassB
{
};
 
class MixBA : ClassB, ClassA
{
};
 
// Resulting code (representation)

class MixAB : BaseInterface, BaseClass, ClassA, ClassB
{
	float Compute()
	{
		// code from BaseClass
		float v0 = 1.0f;
 
		// code from ClassA
		float v1 = 2.0f;
 
		// code from ClassB
		float prevValue = v1;
		float v2 = 5.0f + prevValue;
 
		return v2; // = 7.0f
	}
};

class MixBA : BaseInterface, BaseClass, ClassB, ClassA
{
	float Compute()
	{
		// code from BaseClass
		float v0 = 1.0f;

		// code from ClassB
		float prevValue = v0;
		float v1 = 5.0f + prevValue;
		
		// code from ClassA
		float v2 = 2.0f;

		return v2; // = 2.0f
	}
};
```

## Static calls

You can also use a variable or call a method from a class without having to inherit from it. Just use `<class_name>.<variable or method_name>` in your code. It behaves the same way than a static call. However, be aware that if you statically call a method that uses class variables, the shader won't compile. This is a convenient way to only use a part of a shader, but this isn't an optimization. The shader compiler already automatically removes any unnecessary variables.

**Code:** Static calls

```cs
class StaticClass
{
	float StaticValue;
	float StaticMethod(float a)
	{
		return 2.0f * a;
	}
 
	// this method uses a
	float NonStaticMethod()
	{
		return 2.0f * StaticValue;
	}
};
 
// this class is fine
class CorrectStaticCallClass
{
	float Compute()
	{
		return StaticClass.StaticValue * StaticMethod(5.0f);
	}
};
 
// this class won't compile since the call is not static
class IncorrectStaticCallClass 
{
	float Compute()
	{
		return StaticClass.NonStaticMethod();
	}
};
 
// one way to fix this
class IncorrectStaticCallClassFixed : StaticClass
{
	float Compute()
	{
		return NonStaticMethod();
	}
};
```

## See also

* [Effect language](../effect-language.md)
* [Shading language index](index.md)
    - [Composition](composition.md)
    - [Templating](template.md)
    - [Shader stage input/output automatic management](automatic-shader-stage-input-output.md)
	- [Shader stages](shader-stages.md)