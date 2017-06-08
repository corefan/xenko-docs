# Pointers

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Programmer</span>

**Pointers** are points on the device screen corresponding to **finger touches**. Devices with multi-touch functionality support multiple simultaneous pointers.

On desktop platforms, the left mouse button can be used to simulate pointers. For more information about mouse input, see [Mouse](mouse.md).

## How Xenko processes pointer input

1. The user touches the screen or clicks the left mouse button.

2. Xenko creates a pointer.

3. Xenko assigns **pointer ID** to that pointer corresponding to a given finger.

4. Every time the pointer is modified, Xenko creates a new **pointer event** with that pointer.

5. For each new finger, Xenko creates a new pointer with a new pointer ID.

> [!Note] 
> Each pointer event contains information about only one pointer. If several pointers are modified simultaneously in the same update, Xenko creates a separate event for each pointer.

> [!Warning]
> Each OS handles pointer modifications differently. This means the same finger gesture can generate slightly different pointer event sequences across different platforms. For example, Android doesn't create a new pointer event when a finger touches the screen but doesn't move. For more information, check your OS documentation.

You can enable gesture recognition to detect gestures such as long presses and taps. For more information, see [Gestures](gestures.md).

## The PointerEvent class

[PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) reports pointer events. It contains the current **pointer status** and time information. It is thrown every time the **pointer** is modified.

You can access the list of **pointer events** since the last update using [PointerEvents](xref:SiliconStudio.Xenko.Input.InputManager.PointerEvents). Xenko lists pointer events in chronological order. The list is cleared at every update, so you don't need to clear it manually.

### Get pointer information



You can use the following properties to get information about the pointer that triggered the event:

|Property|Description
|--------|-----------
|[PointerEvent.PointerId](xref:SiliconStudio.Xenko.Input.PointerEvent.PointerId) | Indicates the ID of the pointer which triggered the event.


> [!Warning]
> The ID of a pointer is valid only during a single _Down->Move->Up_ sequence of pointer events.
> A finger can have different IDs each time it touches the screen (even if this happens very quickly).

> [!Warning]
> Each OS has its own way of assigning IDs to pointers.
> There's no relation between the pointer ID values and corresponding fingers.

To check if a pointer event was triggered by a mouse or touch, use:

```cs
bool isTriggeredByMouse = event.Pointer is IMouseDevice
```

### Get the pointer position

You can get the pointer position in normalized or absolute coordinates.

#### Normalized coordinates

@'SiliconStudio.Xenko.Input.PointerEvent.Position' returns the pointer position in **normalized** X and Y coordinates instead of actual screen sizes in pixels. This means the pointer position adjusts to any resolution and you don't have to write separate code for different resolutions.

* (0,0): the pointer is in the top-left corner of the screen
* (1,1): the pointer is in the bottom-right corner of the screen

#### Absolute coordinates

@'SiliconStudio.Xenko.Input.PointerEvent.AbsolutePosition' returns the pointer position in absolute X and Y coordinates (the actual screen size in pixels). For example, if the pointer is in the top-left corner of the screen, the values are (0,0). If the pointer is in the bottom-right corner, the values depends on the screen resolution (eg 1280, 720).

>[!Tip]
>To get the actual size of the screen, use @'SiliconStudio.Xenko.Input.InputManager.Pointer.SurfaceSize'.

### Get pointer events

Use the [PointerEvent.State](xref:SiliconStudio.Xenko.Input.PointerEvent.State) to check the pointer events. This returns a value inside [PointerState](xref:SiliconStudio.Xenko.Input.PointerState).

Xenko recognizes five types of event:

* _Down_: The finger touched the screen.
* _Move_: The finger moved along the screen.
* _Up_: The finger left the screen.
* _Out_: The finger left the touch region.
* _Cancel_: The pointer sequence was canceled. This can happen when the application is interrupted; for example, a phone app might be interrupted by an incoming phone call.

> [!Note] 
> A sequence of pointer events for one pointer always starts with a _Down_ event. This might be followed by one or more _Move_ events, and always ends with an _Up_, _Out_, or _Cancel_ event.

### Get delta values

Use [PointerEvent.DeltaTime](xref:SiliconStudio.Xenko.Input.PointerEvent.DeltaTime) to get the time elapsed from the previous [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) for a particular pointer ID.

Use [PointerEvent.DeltaPosition](xref:SiliconStudio.Xenko.Input.PointerEvent.DeltaPosition) to get the change in position since the previous [PointerEvent](xref:SiliconStudio.Xenko.Input.PointerEvent) for a particular pointer ID.

> [!Note] 
> Delta values are always nulls at the beginning of the sequence of pointer events (ie when the **pointer state** is **down**).



## Example code

This script tracks the pointer movement and prints its positions:

```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Engine;

namespace SiliconStudio.Xenko.Input.Tests
{
    public class PointerTestScript : AsyncScript
    {
        public override async Task Execute()
        {
            var pointerPositions = new Dictionary<int, Vector2>();
            while (true)
            {
                await Script.NextFrame();
                foreach (var pointerEvent in Input.PointerEvents)
                {
                    switch (pointerEvent.EventType)
                    {
                    case PointerEventType.Pressed:
                        pointerPositions[pointerEvent.PointerId] = pointerEvent.Position;
                        break;
                    case PointerEventType.Moved:
                        pointerPositions[pointerEvent.PointerId] = pointerEvent.Position;
                        break;
                    case PointerEventType.Released:
                    case PointerEventType.Canceled:
                        pointerPositions.Remove(pointerEvent.PointerId);
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                    }
                }
                var positionsStr = pointerPositions.Values.Aggregate("", (current, pointer) => current + (pointer.ToString() + ", "));
                Log.Info("There are currently {0} pointers on the screen located at {1}", pointerPositions.Count, positionsStr);
            }
        }
    }
}
```

## See also
* [Gestures](gestures.md)
* [Mouse](mouse.md)
* [Virtual buttons](virtual-buttons.md)
* [Input overview](index.md)