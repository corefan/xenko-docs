# Mouse

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Programmer</span>

The **mouse** is a common input device for desktop games.

There are two ways to handle mouse input in Xenko:

* Query **mouse button states**.
* For cross-platform games that target mobile devices, you can use [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) lists.
For more information, see [Pointers](pointers.md).

You can access **mouse button states** and **pointer events list** from the [Input manager](xref:SiliconStudio.Xenko.Input.InputManager).

| Class | Project type | When to use |
| --- | --- | --- |
| [Input](xref:SiliconStudio.Xenko.Input.InputManager) | Desktop only | For desktop games, you usually handle input with multiple mouse buttons. This means you should use **mouse button states**. |
| [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) | Cross-platform | For mobile games, you usually simulate pointers with just the left mouse button. This means you can treat the mouse input like pointers. There's no need to create separate mouse-specific controls. For more information, see [Pointers](pointers.md).|

For more information about these options, see the [Input index](index.md).

## Check mouse availability
Before handling mouse input, use [Input.HasMouse](xref:SiliconStudio.Xenko.Input.InputManager.HasMouse) to check if a mouse is connected.

> [!Note] 
> Xenko doesn't support mice connected at runtime.

## Query the mouse position

[MousePosition](xref:SiliconStudio.Xenko.Input.InputManager.MousePosition) returns X and Y coordinates which determine the mouse pointer position. The values are between 0 and 1 (normalized values):

* (0,0): the pointer is in the top-left corner of the screen
* (1,1): pointer is in the bottom-right corner of the screen

> [!Note] 
> Xenko uses normalized coordinates instead of actual screen sizes in pixels. This means the pointer position adjusts to any resolution and you don't have to write separate code for different resolutions.

## Query mouse button state changes

You can use the mouse buttons to trigger actions in a project. For example, in first-person shooter games, the left mouse button is commonly used to shoot.

The [Input manager](xref:SiliconStudio.Xenko.Input.InputManager) has several methods that check mouse button states (_Pressed_, _Down_, or _Released_):

| Method | Description |
| --- | --- |
| [HasDownMouseButtons()](xref:SiliconStudio.Xenko.Input.InputManager.HasDownMouseButtons) | Checks if one or more mouse buttons are currently pressed down. |
| [HasPressedMouseButtons()](xref:SiliconStudio.Xenko.Input.InputManager.HasPressedMouseButtons) | Checks if one or more mouse buttons were pressed in the last update. |
| [HasReleasedMouseButtons()](xref:SiliconStudio.Xenko.Input.InputManager.HasReleasedMouseButtons) | Checks if one or more mouse buttons were released in the last update. |
| [IsMouseButtonDown (MouseButton)](xref:SiliconStudio.Xenko.Input.InputManager.IsMouseButtonDown\(SiliconStudio.Xenko.Input.MouseButton\)) | Checks if a specified mouse button is currently pressed down. |
| [IsMouseButtonPressed (MouseButton)](xref:SiliconStudio.Xenko.Input.InputManager.IsMouseButtonPressed\(SiliconStudio.Xenko.Input.MouseButton\)) | Checks if a specified mouse button was pressed in the last update. |
| [IsMouseButtonReleased (MouseButton)](xref:SiliconStudio.Xenko.Input.InputManager.IsMouseButtonReleased\(SiliconStudio.Xenko.Input.MouseButton\)) | Checks if a specified mouse button was released in the last update. |

### Mouse delta

Use [MouseDelta](xref:SiliconStudio.Xenko.Input.InputManager.MouseDelta) to get the change in mouse position in normalized coordinates since the last update. You can use this to analyze mouse movement speed and direction.

### Mouse wheel delta 

You can use the mouse wheel to trigger actions in a project. For example, in a first-person shooter game, moving the mouse wheel might switch weapons or zoom a camera.

The [MouseWheelDelta](xref:SiliconStudio.Xenko.Input.InputManager.MouseWheelDelta) returns a positive value when the user scrolls forwards and a negative value when the user scrolls backwards. A value of `0` indicates no movement.

> [!Note] 
> By default, [MouseWheelDelta](xref:SiliconStudio.Xenko.Input.InputManager.MouseWheelDelta) returns 120*X, where X is the amount of wheel steps scrolled during the last update.

## Lock the mouse position

For some projects, the user needs to move the mouse cursor beyond the borders of the screen. For example, first-person shooter games usually need 360-degree camera rotation. In these cases, you also probably want the mouse cursor to be hidden.

You can lock the mouse position and hide the cursor with the following properties and methods:

| Method or property | Description |
| --- | --- |
| [LockMousePosition(Boolean)](xref:SiliconStudio.Xenko.Input.InputManager.LockMousePosition\(System.Boolean\)) | Locks the mouse position and hides the cursor until the next call to the [UnlockMousePosition()](xref:SiliconStudio.Xenko.Input.InputManager.UnlockMousePosition) event. |
| [UnlockMousePosition()](xref:SiliconStudio.Xenko.Input.InputManager.UnlockMousePosition) | Unlocks the mouse position locked by the [LockMousePosition(Boolean)](xref:SiliconStudio.Xenko.Input.InputManager.LockMousePosition\(System.Boolean\)) event and restores the cursor visibility. |
| [IsMousePositionLocked](xref:SiliconStudio.Xenko.Input.InputManager.IsMousePositionLocked) | Checks if the mouse position is locked. |

> [!Tip] 
> You can get or set mouse visibility with [GameWindow.IsMouseVisible](xref:SiliconStudio.Xenko.Games.GameWindow.IsMouseVisible).

## Example code

```cs
public class MouseInputScript : SyncScript
{
	public override void Update()
	{
		//If the left mouse button is pressed in this update, do something.
		if (Input.IsMouseButtonDown(MouseButton.Left))
		{   
		}
		//If the middle mouse button has been pressed since the last update, do something.
		if (Input.IsMouseButtonPressed(MouseButton.Middle))
		{  
		}

		//If the mouse moved more than 0.2 units of the screen size in X direction, do something.
		if (Input.MouseDelta.X > 0.2f)
		{
		}
		
	}
}
```
## See also
* [Pointers](pointers.md)
* [Virtual buttons](virtual-buttons.md)
* [Keyboard](keyboards.md)
* [Gamepads](gamepads.md)
* [Input overview](index.md)