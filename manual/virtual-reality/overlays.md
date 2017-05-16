# Overlays

In VR games, you can display textures (including render textures) as overlays that appear to float in front of the player. This is especially useful for UIs (sometimes described as a "Minority Report-style" interface).

> ![Note]
> You can't see overlays when you don't run your game in your VR device. This is because the VR device itself creates the overlay.

This page explains how to add an overlay. To display a UI in an overlay, you need to render the UI to a render texture, and display the render texture in the overlay. For instructions, see [Display a UI in an overlay](display-a-UI-in-an-overlay.md).

## Add an overlay

1. In the **asset view** (in the bottom pane by default), double-click the **Graphics Compositor**.

    ![Graphics compositor asset](../graphics/graphics-compositor/media/graphics-compositor-asset.png)

    The Graphics Compositor editor opens.

    For more information about the Graphics Compositor, see the [Graphics compositor](../graphics/graphics-compositor/index.md) page.

2. In the Graphics Compositor, select the **forward renderer** node.

    ![Select forward renderer](media/select-forward-renderer.png)

3. In the **property grid** (on the right by default), expand **VR Settings**.

    ![VR settings](media/vr-settings.png)

4. Next to **Overlays**, click ![Green plus button](~/manual/game-studio/media/green-plus-icon.png) (**Add a new item to the list**).

    Game Studio adds a new overlay to the list.

    ![Add VR item](media/add-overlay.png)

5. Next to **Texture**, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Pick an asset up**).

    The **asset picker** opens.

    ![Select render texture](../graphics/graphics-compositor/media/asset-picker-select-render-texture.png)

6. Select the texture you want to display in the overlay and click **OK**.

Your game is now ready to render the UI to an overlay in your VR device.

## Multiple overlays

You can add as many overlays as you need.

If overlays overlap, items with lower numbers appear on top of items with lower numbers.

## Overlay properties

| Property       | Description   
|----------------|------------------
| Local position | The position of the overlay relative to the user                           
| Local rotation | The rotation of the overlay relative to the user                           
| Surface size   | The size of the overlay, in world units (meters)                           
| Follows head   | If enabled, the overlay follows the user's head, so it's always in front of their view 

You can use the overlay properties to position the overlay.

## Sample

For an example of a UI overlay implemented in a VR game, see the VR template included with Xenko.

## See also

* [Display a UI in an overlay](display-a-UI-in-an-overlay.md)
* [Render to a texture](../graphics/graphics-compositor/render-to-a-texture.md)
* [Graphics compositor](../graphics/graphics-compositor/index.md)