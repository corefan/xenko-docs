# Keyboards

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Programmer</span>

The **keyboard** is the most common input device for desktop games. There are two ways to handle keyboard input in Xenko:

* query **key states**
* use [KeyEvent](xref:SiliconStudio.Xenko.Input.KeyEvent) lists

You can access both from the [input](xref:SiliconStudio.Xenko.Input.InputManager) base class. For more information about these options, see the [input index](index.md)

## Check keyboard availability

Before handling keyboard input, check whether a keyboard is connected using [Input.HasKeyboard](xref:SiliconStudio.Xenko.Input.InputManager.HasKeyboard).

> [!Note]
> Xenko doesn't support keyboards connected at runtime.

## Get key states

You can query **key states** and **state changes** with the following methods:

| Method | Description |
| --- | --- |
| [IsKeyDown(Keys)](xref:SiliconStudio.Xenko.Input.InputManager.IsKeyDown\(SiliconStudio.Xenko.Input.Keys\)) | Checks if a specified key is in the _Down_ state. |
| [IsKeyPressed(Keys)](xref:SiliconStudio.Xenko.Input.InputManager.IsKeyPressed\(SiliconStudio.Xenko.Input.Keys\)) | Checks if a specified key has been _Pressed_ since the last update. |
| [IsKeyReleased(Keys)](xref:SiliconStudio.Xenko.Input.InputManager.IsKeyReleased\(SiliconStudio.Xenko.Input.Keys\)) | Checks if a specified key has been _Released_ since the last update. |

> [!Note] 
> Xenko doesn't support retrieving interpreted keys, such as special characters and capital letters.

## Get key events

In some cases, you want to know all the keys that are currently _Down_, or all the keys that have been _Pressed_ since the last update. The key state API isn't good for this situation, as you have to query each available key separately.

Instead, use the **key events** collections available in the [Input](xref:SiliconStudio.Xenko.Input.InputManager) base class.

| Public List | Description |
| --- | --- |
| [KeyDown](xref:SiliconStudio.Xenko.Input.InputManager.KeyDown) | Gets a list of the keys that were down in the last update. |
| [KeyEvents](xref:SiliconStudio.Xenko.Input.InputManager.KeyEvents) | Gets a list of the key events in the last update (keys pressed or released). |

Every [KeyEvent](xref:SiliconStudio.Xenko.Input.KeyEvent) has two properties: [Key](xref:SiliconStudio.Xenko.Input.KeyEvent.Key) (the affected key) and [KeyEventType](xref:SiliconStudio.Xenko.Input.KeyEvent.Type) (whether the key was _Pressed_ or _Released_).

## Example code

```cs
public class KeyboardEventsScript : SyncScript
{
	//Declared public member variables and properties show in Game Studio.

	public override void Update()
	{
		//Perform an action in every update.
		if (Game.IsRunning)
		{
			if (Input.IsKeyDown(Keys.Left))
			{
				this.Entity.Transform.Position.X -= 0.1f;
			}
			if (Input.IsKeyDown(Keys.Right))
			{
				this.Entity.Transform.Position.X += 0.1f;
			}
		}
	}
}
```

## See also

* [Gamepads](gamepads.md)
* [Mouse](mouse.md)
* [Virtual buttons](virtual-buttons.md)
* [Input overview](index.md)