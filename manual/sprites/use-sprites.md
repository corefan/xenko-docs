# Use sprites

<span class="label label-doc-level">Intermediate</span>
<span class="label label-doc-audience">Programmer</span>

To add a sprite to a scene, add a **sprite component** to an entity. Afterwards, you can control the sprite with a script.

## Add a sprite component

1. In the **Scene Editor**, select the entity you want to add a sprite to.

    >[!Tip]
    >To create an entity, right-click the scene or entity tree and select **Empty entity**.

2. In the **property grid**, click **Add component** and select **Sprite**.

    ![Sprite sheet](media/SpriteEntity.png)

    Game Studio adds a Sprite component to the entity.

3. From the **asset view**, drag the sprite sheet to the **Source** field in the Sprite component:

    <p>
        <video autoplay loop class="responsive-video" poster="media\drag-sprite-sheet-to-asset-picker.png">
        <source src="media\drag-sprite-sheet-to-asset-picker.mp4" type="video/mp4">
        </video>
    </p>

    Alternatively, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Pick an asset up**):

    ![Pick asset up](media/pick-asset-up.png)

    Then choose a sprite sheet:

    ![Asset picker](media/asset-picker.png)

Game Studio adds the sprite to the entity.

## Use sprites in a script

You can use scripts to render sprites at runtime. To do this, attach the script to an entity with a sprite component.

For information about how to add scripts to entities, see [Add a script](../scripts/add-a-script.md).

### Code sample

This script displays a sprite that advances to the next sprite in the index every second. After it reaches the end of the sprite index, it loops.

```cs
using SiliconStudio.Xenko.Rendering.Sprites;

public class Animation : SyncScript
{
   // Declared public member fields and properties are displayed in Game Studio.
   private SpriteFromSheet sprite;
   private DateTime lastFrame;

   public override void Start()
   {
       // Initialize the script.
       sprite = Entity.Get<SpriteComponent>().SpriteProvider as SpriteFromSheet;
       lastFrame = DateTime.Now;
   }

   public override void Update()
   {
      // Do something every new frame.
      if ((DateTime.Now - lastFrame) > new TimeSpan(0, 0, 1))
      {
         sprite.CurrentFrame += 1;
         lastFrame = DateTime.Now;
      }
   }
}
```

## See also

* [Import sprite sheets](import-sprite-sheets.md)
* [Edit sprites](edit-sprites.md)