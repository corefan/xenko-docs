# Scripting

**Scripts** are units of code that handle game events, respond to user input, and control entities. In short, scripts make games interactive by adding gameplay.

Xenko scripts are written in **C#**. You can edit scripts in Game Studio or another IDE (such as visual Studio). Scripts are debugged in Visual Studio.

![Scripting](media/scripting_intro.png)

```cs
public class BasicAsyncScript : AsyncScript
{         
	public override async Task Execute() 
	{
		while(Game.IsRunning)
		{
			// Do some stuff every frame
			
			await Script.NextFrame();
		}
	}
 }
```

> [!NOTE]
> Explaining C# is out of the scope of this documentation.

Scripts have access to the [IScriptContext](xref:SiliconStudio.Xenko.Engine.IScriptContext), which accesses the main modules of the Xenko engine:

* [Audio](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Audio): the audio system
* [Content](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Content): loads and saves content from assets
* [EffectSystem](xref:SiliconStudio.Xenko.Engine.ScriptComponent.EffectSystem): loads and compiles effects and shaders
* [Game](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Game): accesses all information related to your game
* [GraphicsDevice](xref:SiliconStudio.Xenko.Engine.ScriptComponent.GraphicsDevice): low-level graphics device to create GPU resources
* [Input](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Input): keyboard, mouse and gamepad states and events
* [Services](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Services): a registry of services that you can use to register your own services
* [SceneSystem](xref:SiliconStudio.Xenko.Engine.ScriptComponent.SceneSystem): the currently displayed scene
* [Script](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Script): accesses the script manager to schedule or wait for the termination of scripts
* [SpriteAnimation](xref:SiliconStudio.Xenko.Engine.ScriptComponent.SpriteAnimation): animates sprites
* [Log](xref:SiliconStudio.Xenko.Engine.ScriptComponent.Log): logs messages and errors from scripts

You can still use standard C# classes in Xenko, but these aren't called scripts and you can't attach them to entities in Game Studio.

## In this section

* [Types of script](types-of-script.md)
* [Create a script](create-a-script.md)
* [Public properties and fields](public-properties-and-fields.md)
* [Add a script](add-a-script.md)
* [Scheduling and priorities](scheduling-and-priorities.md)
* [Debugging](debugging.md)