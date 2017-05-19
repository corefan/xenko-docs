# UI

<div class="doc-incomplete"/>

The Xenko UI **layout** system is similar to the Windows Presentation Foundation (WPF) layout system. For more information about the WPF layout system, see the [MSDN documentation](https://msdn.microsoft.com/en-us/library/ms745058(v=vs.110).aspx).

Many of the usual components and containers are all here, and on top of that it supports both 2D and 3D in a resolution-independent way.

## Controls

Xenko features many UI control components, including:

- @'SiliconStudio.Xenko.UI.Controls.ImageElement'
- @'SiliconStudio.Xenko.UI.Controls.ContentControl'
  - @'SiliconStudio.Xenko.UI.Controls.ScrollViewer'
  - @'SiliconStudio.Xenko.UI.Controls.Button'
    - @'SiliconStudio.Xenko.UI.Controls.ToggleButton'
  - @'SiliconStudio.Xenko.UI.Controls.ContentDecorator'
- @'SiliconStudio.Xenko.UI.Controls.TextBlock'
  - @'SiliconStudio.Xenko.UI.Controls.ScrollingText'
- @'SiliconStudio.Xenko.UI.Controls.EditText' (displays soft keyboard on mobile devices)
- @'SiliconStudio.Xenko.UI.Panels.Panel'
  - @'SiliconStudio.Xenko.UI.Panels.StackPanel' (supports virtualization)
  - @'SiliconStudio.Xenko.UI.Panels.Grid'
  - @'SiliconStudio.Xenko.UI.Panels.UniformGrid'
  - @'SiliconStudio.Xenko.UI.Panels.Canvas'
- @'SiliconStudio.Xenko.UI.Controls.ScrollBar'
- @'SiliconStudio.Xenko.UI.Controls.ModalElement'

You can also create your own.

## Examples

You can find a complete example by creating a new project in [Game Studio](../game-studio/index.md) and selecting the **GameMenu** template.

![media/ui-1.png](media/ui-1.png) 

![media/ui-2.png](media/ui-2.png) 

## Performance

Drawing of multiple elements will be batched using a 3D Sprite batch renderer to reduce number of draw call. Objective is to keep CPU available for more important stuff.