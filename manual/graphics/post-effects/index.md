# Post-effects

**Post-effects** are usually applied after your game has completed the rendering of a frame, but before the UI is drawn.  They're used to tune or embellish an image; for example, by giving it a more natural, realistic look. They can also be used purely artistically to change the mood of a scene.

![media/post-effects-reference-1.png](media/post-effects-reference-1.png) 

Post-effects are usually applied on an image. This means they have no connection with vertices or meshes. They only work with the color values of each pixel (and sometimes their depth).

A post-effect is typically set up by specifying:

- input buffers (eg color, depth)
- one or several output buffers
- parameters to customize the behavior of the post-effect during its rendering pass

Xenko provides several pre-defined post-effects. You can extend the system to create your own.

## In this section

* [Bloom](bloom.md)
* [Bright filter](bright-filter.md)
* [Color transforms](color-transforms/index.md)
* [Depth of field](depth-of-field.md)
* [Lens flare](lens-flare.md)
* [Light streaks](light-streaks.md)
* [Post-effects for developers](post-effects-for-developers.md)