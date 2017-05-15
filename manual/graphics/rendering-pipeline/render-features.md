# Render features

A @'SiliconStudio.Xenko.Rendering.RenderFeature' is responsible for drawing a given type of @'SiliconStudio.Xenko.Rendering.RenderObject'.

## Render phases

### Collect

The collect phase determines what needs to be processed and rendered. It's usually driven by the [Graphics Compositor](../graphics-compositor/index.md).

It is responsible for:

* creating render views, and updating them with the most recent data such as view and projection matrices
* creating and setting up render stages
* performing visibility culling and sorting

### Extract

The extract phase copies data from game states of previously collected objects to short-lived render-specific structures. It's usually driven by the @'SiliconStudio.Xenko.Rendering.RenderSystem' and @'SiliconStudio.Xenko.Rendering.RenderFeature's.

This should be as fast as possible and avoid heavy computations since game update and scripts are blocked (heavy computations should be deferred to [Prepare](#prepare)).

> [!Note]
> Currently, Xenko doesn't parallelize game updates and scripts, so they won't be resumed until Prepare and Draw are finished.

Example tasks:

* copying object matrices
* copying material parameters

### Prepare

During Prepare, Xenko performs heavy computations and prepare GPU resources. This is usually driven by the @'SiliconStudio.Xenko.Rendering.RenderSystem' and @'SiliconStudio.Xenko.Rendering.RenderFeature's.

Example tasks:

* computing lighting data and structures
* filling constant buffers and resource tables

### Draw

During Draw, Xenko fills GPU command list.

Example tasks:

* setting up render targets
* drawing combinations of render stage with render view.

### Example

A typical example of views, stages created during **Collect** phase, and Xenko uses them during the **Draw** phase:

![media/render-features-draw-example.png](media/render-features-draw-example.png)

### Pipeline processors

Pipeline processors are classes called when creating the [pipeline state](../low-level-api/pipeline-state.md). This lets you do things such as enable alpha blending or wireframe rendering on a specific render stage.

Xenko includes several predefined pipeline processors. You can also create your own.

## See also

* [Render features index](index.md)