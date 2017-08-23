# Add entities

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Level Designer</span>

After you create a scene, you need to add entities to your scene to build your level.

## Create an entity from the scene editor

1. Above the **entity tree**, click the ![Plus](media/add-entities-to-a-scene-plus-icon.png) icon.

    The **Create** menu opens:

   ![Scene editor Create menu](media/add-entities-to-a-scene-context-menu.png)

   Alternatively, right-click the **entity tree** or anywhere in the **scene**. If you create an entity in the scene, Game Studio adds an entity in the location you click.

    ![Right-click entity tree or scene](media/create-entity-in-scene.png)

2. Select **Empty entity**, or select an entity template.

   Game Studio adds an entity to the scene and displays it in the entity tree:

    ![New Entity in MainScen](media/add-entities-to-a-scene-empty-entity.png)

## Create an entity from an asset

You can add an entity by dragging and dropping an asset from the **asset view** to the scene. 

<video controls autoplay loop height="360" width="480">
   <source src="media/add-entities-to-scene-drag-and-place-entity.mp4" type="video/mp4">
</video>

Game Studio automatically creates an entity and adds the required component and reference based on the asset you used. For example, if you drag a model asset to the scene, Game Studio creates an entity with a model component with the model asset as its reference.

> [!NOTE]
> You can only create entities by dragging assets with corresponding components. For example, model components use model assets, so can be dragged; animations have no corresponding component, so can't be dragged.
   
## Set up a component

**Components** add special properties to entities that define their purpose in your project. For example, you add lights to your scene by adding Light components to entities, add models by adding model components, and so on. An entity with no component has no purpose.

To add a component to an entity:

1. Select the entity.

2. In the property grid, click **Add component**, and add component you want.

   ![Add a component in the property grid](media/add-entities-to-a-scene-add-model-component.png)

   Game Studio adds the component.

   ![New component in property grid](media/add-entities-to-a-scene-add-model-component-added.png)

3. **Set the properties** of your new component.

## Duplicate an entity

You can duplicate an entity along with all its properties. Duplicating an entity and then modifying the properties of the new entity is often faster than creating an entity from scratch.

1. Select the entity you want to duplicate.
2. Hold **Ctrl** and move the entity with the mouse.

   The entity and all its properties are duplicated.
   
	<video controls autoplay loop height="360" width="480">
	   <source src="../get-started/media/populate-scene-duplicate-entity.mp4" type="video/mp4">
	</video>

Alternatively, right-click the entity and select **Duplicate selected entities**.

   ![Duplicate selected entities](../get-started/media/duplicate-selected-entities.png)

## Rename an entity

1.	Select the entity and press **F2**.
2.	Type a name for the entity, and then press **Enter**.

   ![Renamed entity in a scene](media/add-entities-to-a-scene-renamed-entity.png)