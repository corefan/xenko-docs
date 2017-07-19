# Prefab models

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Designer</span>

**Prefab models** convert prefabs to single models. This is useful for optimization, as Xenko only renders the model instead of the separate entities in the prefab. When you make changes to the prefab, Game Studio updates the prefab model automatically.

Currently, prefab models don't inherit elements such as lights, colliders, or other components - they're only models, and have to be used just like other models. For example, if you have a prefab comprising two models and a light component, the prefab model creates a single model from the two models and ignores the light component. If you need to add components to a prefab model, add them to the prefab model itself.

## Create a prefab model

1. In the **asset view**, select **Add asset > Model > Prefab model**.

    ![Add prefab model](media/add-prefab-model.png)

2. In the property grid (on the right by default), next to **Prefab**, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Select asset**).

    ![Prefab properties](media/prefab-model-properties.png)

    The **Asset picker** opens.

    ![Select prefab for model](media/select-prefab-for-model.png)

3. Select the prefab you want to create a model from and click **OK**.

    Game Studio adds the prefab model to the asset view.

    ![Prefab model added](media/prefab-model-added.png)

## See also

* [Create a prefab](create-a-prefab.md)
* [Use prefabs](use-prefabs.md)
* [Edit prefabs](edit-prefabs.md)
* [Nested prefabs](nested-prefabs.md)
* [Override prefab properties](override-prefab-properties.md)
* [Archetypes](../archetypes.md)