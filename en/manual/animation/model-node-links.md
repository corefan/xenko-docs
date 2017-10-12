# Model node links

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Artist</span>

The **model node link** component lets you attach an entity to a node in a skeleton on another entity.

For example, imagine you have two models: a character, and a sword. The character has a sword swinging animation. You can use a model link node to place the sword in the model's hand and attach it to the correct node in the character skeleton, so the sword swings with the animation.

<p>
<video autoplay loop class="responsive-video" poster="../particles/tutorials/media/sword-slash-1.jpg">
   <source src="../particles/tutorials/sword-slash-1.mp4" type="video/mp4">
</video>
</p>

## Set up a model node link component

1. In the **scene editor**, select the entity you want to link to a node in another entity.

2. In the **property grid**, click **Add component** and select **Model node link**.

    ![Add component](../particles/tutorials/media/add-model-node-link.png)

    Game Studio adds a model node link component to the entity.

    ![Model node link component](media/model-node-component.png)

    The component only has two properties: **Node name** and **Target**.

3. In the **Target** field, specify the model you want to link the entity to.

    >[!Tip]
    >If you don't specify a model, Xenko links the entity to the parent entity.

4. In the **Node name** field, select the node in the model you want to attach this entity to.

    ![Select node](media/select-node.png)

## See also

* [Import animations](import-animations.md)
* [Animation properties](animation-properties.md)
* [Set up animations](set-up-animations.md)
* [Preview animations](preview-animations.md)
* [Animation scripts](animation-scripts.md)
* [Additive animation](additive-animation.md)
* [Procedural animation](procedural-animation.md)
* [Custom blend trees](custom-blend-trees.md)