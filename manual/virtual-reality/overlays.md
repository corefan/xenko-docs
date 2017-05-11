# Overlays

In VR games, it's often useful to display elements such as user interfaces as **overlays** in the player view. To do this, render the UI to a texture.

## Set up a VR overlay in the graphics compositor

1. In the **asset view** (in the bottom pane by default), double-click the **Graphics Compositor**.

    ![Graphics compositor asset](../graphics/graphics-compositor/media/graphics-compositor-asset.png)

    The Graphics Compositor editor opens.

2. In the Graphics Compositor, select the **forward renderer** node.

    ![Select forward renderer](media/select-forward-renderer.png)

3. In the **property grid** (on the right by default), expand **VR Settings**.

    ![VR settings](media/vr-settings.png)

4. Next to **Overlays**, click ![Green plus button](~/manual/game-studio/media/green-plus-icon.png) (**Add a new item to the list**).

    Game Studio adds a new overlay to the list.

    ![Add VR item](media/add-overlay.png)

5. Next to **Texture**, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Pick an asset up**).

    The **asset picker** opens.

6. Select the **render texture** you want to overlay in VR.

## Overlay properties

## Multiple overlays

## Sample

For an example of an overlay implemented in a VR game, see the VR sample included with Xenko.

## See also

* [Render to a texture](../graphics/graphics-compositor/render-to-a-texture.md)