# Render Stages

A Render Stage defines a way to render a given object (usually with its associated effect/shader).

It also offer way to control advanced properties such as sorting and filtering of those objects.

Objects can subscribe to multiple render stages. For example, a mesh typically subscribes to both `Main` (a.k.a. Opaque) and `ShadowCaster` stage, or `Transparent` stage.

> **Note**
>
> A Render Stage doesn't define any rendering order.
>
> Rendering order is controlled by Graphics Compositor Renderers.

## Effect Slot

Some stages are usually exclusive: an object is either in the `Opaque` (a.k.a. Opaque) stage or `Transparent` stage, not both of them at the same time.

For that reason, each RenderStage has an @'SiliconStudio.Xenko.Rendering.RenderStage.EffectSlotName'. If several Render Stages share the same effect slot name, they will share the same effect instance.

A typical setup of render stages would look like:

| Render Stage     | Effect Slot  |
| ---------------- | ------------ |
| Main (Opaque)    | Main         |
| Transparent      | Main         |
| UI               | Main         |
| ShadowCaster     | ShadowCaster |

## Sorting

@'SiliconStudio.Xenko.Rendering.RenderStage.SortMode' defines how objects within that Render Stage are sorted.

Xenko already contains several @'SiliconStudio.Xenko.Rendering.SortMode' implementation such as:
- @'SiliconStudio.Xenko.Rendering.FrontToBackSortMode' which renders front to back with limited precision, and try to avoid state changes within the same depth range of objects (useful for opaque and shadow casters)
- @'SiliconStudio.Xenko.Rendering.BackToFrontSortMode' which renders strictly back to front (useful for transparent objects)
- @'SiliconStudio.Xenko.Rendering.StateChangeSortMode' which try to reduce state changes

Of course, user are free to implement their own.

## Filtering

You can create your own filter for objects in a Render Stage by inheriting from @'SiliconStudio.Xenko.Rendering.RenderStageFilter'.

### Render stage selectors

Render stage selectors define which objects in your scene are sent to which render stage, and choose which [effect](../effects-and-shaders/effect-language.md) to use when rendering a given object.

For example, this is the typical setup for meshes:

- @'SiliconStudio.Xenko.Rendering.MeshTransparentRenderStageSelector' chooses either the `Main` or `Transparent` render stage, depending on the material properties. The default effect is `XenkoForwardShadingEffect` defined by Xenko (you can create your own if you want).
- @'SiliconStudio.Xenko.Rendering.ShadowMapRenderStageSelector' selects opaque meshes that cast shadows and adds them to the `ShadowMapCaster` render stage. The default effect is `XenkoForwardShadingEffect.ShadowMapCaster`, defined by Xenko.

Either can filter by render group.

You can customize everything, so you can add other predefined render stage selectors (eg to add UI to a later full-screen pass), or create your own selector specific to your game.