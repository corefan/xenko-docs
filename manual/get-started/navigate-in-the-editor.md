# Navigate in the scene editor

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Level Designer</span>

You can move around the scene and change the perspective of the editor camera. The XYZ axes in the bottom left show your orientation in 3D space.

   ![Scene orientation gizmo](media/navigate-in-a-scene-scene-orientation-gizmo.png)

## Move around in the scene
There are several ways to move the camera editor around the scene editor. 

> [!TIP]
> Holding the **Shift** key speeds up movement.

### Walk

You can "walk" by holding the **left mouse button** and **moving the mouse**. This moves along the X and Z dimensions.


<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-walk-in-the-scene.mp4" type="video/mp4">
</video>

### Fly

To fly around the scene, hold the **right mouse button**, then **move the mouse** to change the camera direction and use the **WASD keys** to move. This is similar to the controls of many action games.

Action                          | Effect
--------------------------------|--------------
**Right mouse button + move mouse**              | Rotate editor camera
**A key + right mouse button**  | Move left
**D key + right mouse button**  | Move right
**S key + right mouse button**  | Move backward
**W key + right mouse button**  | Move forward
**Q key + right mouse button**  | Move down
**E key + right mouse button**  | Move up
 
<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-fly-in-the-scene.mp4" type="video/mp4">
</video>
 
### Rotate around a point

You can rotate around a center point by holding **Alt** and the **left mouse button** together and moving the **mouse**.

The point of rotation is always the center of the screen. You can adjust the distance to the center with the **mouse wheel**.

![Rotation](media/navigate-in-scene-orbital-rotation-schema.png)

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-orbital-rotation.mp4" type="video/mp4">
</video>
 
### Focus on an entity

After you select an entity, press the **F** key. This zooms in on the entity and centers it in the camera editor.

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-focus-on-entity-using-f-key.mp4" type="video/mp4">
</video>

Alternatively, in the **entity tree**, click the ![focus icon](media/navigate-in-a-scene-magnifier-icon.png) icon next to an entity. You don't have to select the entity first.

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-focus-on-entity-using-magnifier-icon.mp4" type="video/mp4">
</video>

> [!TIP] 
> Focusing and then rotating with **Alt + left mouse button** is useful for inspecting entities.

### Controls

Action                 | Controls
-----------------------|--------------
Translate              | Arrow keys, Any mouse button pressed + A, S, D, Q, W, and E keys
Walk                   | Left mouse button
Look around in a scene | Right mouse button
Orbital rotation       | Alt key + Left mouse button
Zoom in or zoom out    | Rotate mouse wheel, Alt key + Right mouse button
Pan                    | Press middle mouse button
Focus                  | Select an entity and press the F button

## Change camera editor perspective

You can change the camera editor perspective using the **view camera gizmo** in the top-right of the scene editor.

![View camera gizmo](media/navigate-in-a-scene-view-camera-gizmo.png)

### Snap camera to position

To change the angle of the editor camera, click the corresponding face, edge, or corner of the **view camera gizmo**.

Click    | Camera position
---------|--------------
Face     | Faces the selected face
Edge     | Faces the two adjacent faces at a 45° angle
Corner   | Faces the three adjacent faces at a 45° angle

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-change-view-angle.mp4" type="video/mp4">
</video>

### Switch between perspective and orthographic views

**Perspective view** is a "real-world" perspective of the objects in your scene. In this view, lines of identical lengths appear different due to foreshortening, as in reality.

In **orthographic view**, lines of identical length appear the same length. Parallel lines never touch, and there's no vanishing point. It's easy to tell, for example, if objects are lined up exactly.

   ![Perspective and orthographic diagram](media/perspective-orthographic-diagram.png)

   ![Perspective and orthographic views](media/perspective-and-orthographic-views.png)

To switch between perspective and orthographic views, click the **view camera gizmo** as you face it.

<video controls autoplay loop height="240" width="320">
                <source src="media/navigate-in-scene-switch-projection-mode.mp4" type="video/mp4">
</video>

## What's next?

* [Launch a game](launch-a-game.md)