# Animate a camera with a model

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Artist</span>

You can use model files such as `.fbx` or `.obj` to animate cameras at runtime.

>[!Note]
>To animate a camera using a model file, you first need to bake the animation using your modeling tool (eg Maya, 3ds Max or Blender).

>[TODO] Xenko doesn't support cameras animated using target cameras.

## 1. Import the model file

Import the model, animation and skeleton from the model file. To do this:

1. Drag the model file from Explorer to the **asset view** (in the bottom pane by default).

    * Alternatively, in the **asset view**:

        1a. Click ![Add asset](../../animation/media/create-and-add-assets-add-new-asset-button.png) and select **Import directly from files**.
    
        ![Choose asset type](../../animation/media/create-and-add-assets-add-new1.png)

        2b. Browse to the model file and click **Open**.

2. Select **3D model**.

    ![Select 3D model](media/select-3d-model.png)

    The **Import from model** dialog opens.

    ![Import from model](media/import-model-dialog.png)

2. Make sure **Import skeleton** is selected and click **OK**.

    Game Studio imports the **model** and **skeleton** from the model file and adds them to the asset view.

    ![Camera assets](media/camera-assets.png)

3. Repeat step 1 to import the model file again. This time, select **Animation**.

    ![Select animation](media/select-animation.png)

    Game Studio imports the **animation clip** from the model file and adds it to the asset view.

    ![Camera animation](media/camera-animation-asset.png)

## 2. Set up the entities

In the **scene editor**, create an entity to hold the camera you want to animate.

1. Right-click the scene, select **Empty entity**, and type a name.

    ![Create empty entity](../../ui/media/create-empty-entity.png)

    ![Camera holder name](media/add-camera-holder.png)

2. Select the entity you created in the previous step. In the **property grid** on the right, click **Add component** and select **Animations**.

    ![Select an entity](media/select-animation-component.png)

    Game Studio adds an animation component to the entity.

    ![Animation component](media/animation-component-added.png)

3. Next to **Animations**, click ![Green plus button](~/manual/game-studio/media/green-plus-icon.png) (**Add...**) and type a name.

    ![Add animation](media/animation-name.png)

    Game Studio adds an animation to the list.

    ![Animation added](media/animation-added.png)

4. Next to the animation you added, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Select an asset**).

    The **Select an asset** window opens.

    ![Select an asset](media/select-an-asset.png)

5. Select the camera animation asset and click **OK**.

## 3. Set up the animation

Create a script to control the animation. To do this:

1. To do this, in the **asset view**, click **Add asset** and select **Script > Animation start**.

    ![Add animation script](media/select-animation-script.png)

    The **New script** window opens.

    ![Create script](../../animation/media/name-animation-script.png)

2. Type a name for the script and click **Create script**.

    If Game Studio asks if you want to save your script, click **Save script**.

    >[!Note]
    >For more information about animation scripts, see [Animation scripts](../../animation/animation-scripts.md).

3. Reload the assemblies.

    ![Reload assemblies](../../platforms/media/reload-assemblies.png)

4. Select the entity you created earlier. In the **property grid**, click **Add component** and select the animation script.

    ![Add animation script](media/add-animation-script.png)

    Game Studio adds the script to the entity as a component.

5. Under the script component, next to **Animations**, click ![Green plus button](~/manual/game-studio/media/green-plus-icon.png) (**Add...**).

    ![Add animation to the list](../../animation/media/add-animation-to-list.png)

6. Next to **Clip**, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Select an asset**).

    The **Select an asset** window opens.

    ![Select camera animation asset](media/select-camera-animation-asset.png)

7. Select the camera animation and click **OK**.

8. Click **Add component** and select **Model**.

    ![Add model component](media/add-model-component.png)

    Game Studio adds a model component to the entity.

    ![Model component added](media/model-component-added.png)

9. Next to **Model**, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Select an asset**)
    
    The **Select an asset** window opens.

    ![Select camera animation asset](media/select-model-asset.png)

10. Select the camera model and click **OK**.

## 4. Set up the model node link

The node model link component connects an entity to a node in a model contained in another entity. You can use it to connect the camera to the camera holder, which contains the model and animation.

1. In the **entity tree**, drag the **camera entity** you want to animate to the entity you created. This makes the camera a child of the entity.

    ![Parent and child](media/parent-and-child.png)

2. Select the camera entity.

3. In the **property grid**, click **Add component** and select **Model node link**.

    Game Studio adds a model link component to the entity.

4. In **Node name**, select the node you want to link to from the file.

    ![Node link](media/select-node.png)

5. Leave **Target** blank. This means the entity attaches itself to the parent entity.

At runtime, the camera animates according to the model file.

## See also

* [Animation](../../animation/index.md)
* [Animation scripts](../../animation/animation-scripts.md)