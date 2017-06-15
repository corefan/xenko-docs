# Layout

<span class="label label-doc-level">Intermediate</span>
<span class="label label-doc-audience">Programmer</span>

The Xenko UI **layout** system is similar to the Windows Presentation Foundation (WPF) layout system. For more information about the WPF layout system, see the [MSDN documentation](https://msdn.microsoft.com/en-us/library/ms745058(v=vs.110).aspx).

Every @'SiliconStudio.Xenko.UI.UIElement' in the Xenko UI system has a surrounding rectangle used in layouts. Layouts are computed according to the requirements of the @'SiliconStudio.Xenko.UI.UIElement', available screen space, constraints, margin, padding, and the special behavior of @'SiliconStudio.Xenko.UI.Panels.Panel' elements (which arrange children in specific ways). Processing this data recursively, the layout system computes a position and size for every @'SiliconStudio.Xenko.UI.UIElement' in the UI system.

## Measure and arrange

Xenko performs the layout process recursively in two passes: [Measure](xref:SiliconStudio.Xenko.UI.UIElement.Measure\(SiliconStudio.Core.Mathematics.Vector3\)) and [Arrange](xref:SiliconStudio.Xenko.UI.UIElement.Arrange\(SiliconStudio.Core.Mathematics.Vector3,System.Boolean\)).

### Measure

In the [Measure](xref:SiliconStudio.Xenko.UI.UIElement.Measure\(SiliconStudio.Core.Mathematics.Vector3\)) pass, each element recursively computes its @'SiliconStudio.Xenko.UI.UIElement.DesiredSize' according to properties you set, such as:

* @'SiliconStudio.Xenko.UI.UIElement.Width' 
* @'SiliconStudio.Xenko.UI.UIElement.Height'
* @'SiliconStudio.Xenko.UI.UIElement.Margin'

Some @'SiliconStudio.Xenko.UI.Panels.Panel' elements call [Measure](xref:SiliconStudio.Xenko.UI.UIElement.Measure\(SiliconStudio.Core.Mathematics.Vector3\)) recursively to determine the @'SiliconStudio.Xenko.UI.UIElement.DesiredSize' of their children, and act accordingly.

### Arrange

The [Arrange](xref:SiliconStudio.Xenko.UI.UIElement.Arrange\(SiliconStudio.Core.Mathematics.Vector3,System.Boolean\)) pass arranges the elements, taking into account:

* @'SiliconStudio.Xenko.UI.UIElement.Margin'
* @'SiliconStudio.Xenko.UI.UIElement.Width'
* @'SiliconStudio.Xenko.UI.UIElement.Height'
* @'SiliconStudio.Xenko.UI.UIElement.HorizontalAlignment'
* @'SiliconStudio.Xenko.UI.UIElement.VerticalAlignment' 
* @'SiliconStudio.Xenko.UI.Panels.Panel' 
* specific [Arrange](xref:SiliconStudio.Xenko.UI.UIElement.Arrange\(SiliconStudio.Core.Mathematics.Vector3,System.Boolean\)) rules

## See also

* [MSDN WPF layout documentation](https://msdn.microsoft.com/en-us/library/ms745058(v=vs.110).aspx)
* [UI editor](editor.md)