# Post effects

**Post effects** are usually applied after your game has completed the rendering of a frame, but before the UI is drawn. You can use post effects to tune or embellish an image; for example, by giving it a more natural, realistic look, or to create stylized cinematic effects.

![media/post-effects-reference-1.png](media/post-effects-reference-1.png) 

Post effects are usually applied to an image. This means they have no connection with vertices or meshes. They only work with the color values of each pixel (and sometimes their depth).

Typically, you set up a post effect by specifying:

- input buffers (eg color, depth)
- one or several output buffers
- parameters to customize the behavior of the post effect during its rendering pass

Xenko provides several predefined post effects. You can also [extend the system to create your own](custom-post-effects.md).

## Add or edit a post effect

You add and edit post effects in the [graphics compositor](../graphics-compositor/index.md).

1. In the **asset view** (in the bottom pane by default), double-click the **Graphics Compositor** asset.

    ![Graphics Compositor asset](..\graphics-compositor\media\graphics-compositor-asset.png)

    The graphics compositor editor opens.

    ![Graphics Compositor editor](..\graphics-compositor\media\graphics-compositor-editor.png)

2. Select the **Post-processing effects** node.

    If there's no post-processing effects node, right-click and select **Create > post-processing effects**.

    Game Studio adds a post effect node to the graphics compositor.

3. In the **forward renderer** node, on the **PostEffects** slot, click and drag a link to the **post-processing effects** node.

4. In the **property grid** (on the right by default), enable the post effects you want to use and set their properties. For details about each post effect and its properties, see the pages below.

## In this section

* [Bloom](bloom.md)
* [Bright filter](bright-filter.md)
* [Color transforms](color-transforms/index.md)
    * [Film grain](color-transforms/film-grain.md)
    * [Gamma correction](color-transforms/gamma-correction.md)
    * [ToneMap](color-transforms/tonemap.md)
    * [Vignetting](color-transforms/vignetting.md)
* [Depth of field](depth-of-field.md)
* [Lens flare](lens-flare.md)
* [Light streaks](light-streaks.md)
* [Custom post effects](custom-post-effects.md)

## See also

* [Graphics compositor](../graphics-compositor/index.md)