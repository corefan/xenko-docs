# Rendering pipeline

Xenko's rendering pipeline is designed around the following key concepts.

## Render features

Rendering code is divided into @'SiliconStudio.Xenko.Rendering.RenderFeature's, each of which is responsible for processing a single type of @'SiliconStudio.Xenko.Rendering.RenderObject'.

Render features include mesh rendering, sprite rendering, particle rendering, and so on.

Features are executed in multiple phases: **Collect**, **Extract**, **Prepare** and **Draw**. This means each step of the pipline can be isolated, parallelized and optimized separately. For more details, see [Render features](render-features.md).

## Render views

Scenes can be rendered from multiple view points, represented as @'SiliconStudio.Xenko.Rendering.RenderView's; for example player views (there may be several in a split-screen game) or shadow views, with one view per shadow map cascade.

Views are a first-class concept, and available to all rendering-phases, allowing batching across multiple views.

## Render stages

A stage is used to select the [effect](../effects-and-shaders/index.md) and [pipeline state](../low-level-api/pipeline-state.md) per object, as well as to define the output of the current pass.

## Visibility

@'SiliconStudio.Xenko.Rendering.RenderObject's are registered with a @'SiliconStudio.Xenko.Rendering.VisibilityGroup'. During the **Collect**-phase the visibility group performs
customizable culling and filtering based on the @'SiliconStudio.Xenko.Rendering.RenderView', @'SiliconStudio.Xenko.Rendering.RenderStage', etc.

## In this section

* [Render features](render-features.md)