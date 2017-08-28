# Render groups and masks

<span class="label label-doc-level">Intermediate</span>
<span class="label label-doc-audience">Designer</span>

With **render groups** and **render masks**, you can choose which models are rendered by different [cameras](../cameras.md). For example, you can have a model be visible to Camera A but invisible to Camera B.

## Set a render group

1. In the scene, select the entity with the model component you want to add to a render group.

2. In the **property grid**, next to **Render group**, select the group you want the model to belong to.

    ![Select render group](media/select-render-group.png)

## Set a render mask

The **render mask** filters which groups are rendered.

1. In the **asset view** (in the bottom pane by default), double-click the **Graphics Compositor** asset.

    ![Graphics Compositor asset](media/graphics-compositor-asset.png)

    The graphics compositor editor opens.

    ![Graphics Compositor editor](media/graphics-compositor-editor.png)

2. Select the **Entry points** node.

    ![Entry points node](media/entry-points-node.png)

3. In the **property grid** on the right, expand the renderer you want to render the model.

3. Next to **Render mask**, click **Change values** and select the render groups you want the camera to render.

    ![Render mask](media/change-render-mask.png)

## See also

* [Cameras](../cameras.md)
* [Camera slots](../camera-slots.md)
* [Graphics compositor](index.md)
* [Scene renderers](scene-renderers.md)
* [Render textures](render-textures.md)