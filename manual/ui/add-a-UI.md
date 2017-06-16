# Add a UI

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Artist</span>
<span class="label label-doc-audience">Designer</span>

After you create a UI page, add it to the scene as a component.

1. In the **scene editor**, create an empty entity. To do this, right-click the scene and select **Empty entity**.

    ![Create empty entity](media/create-empty-entity.png)

2. In the property grid (on the right by default), click **Add component** and select **UI**.

    ![Add UI component](media/add-UI-component.png)

    Game Studio adds a **UI component** to the entity.

    ![UI component](media/UI-component.png)

3. Next to **Page**, click ![Hand icon](~/manual/game-studio/media/hand-icon.png) (**Pick an asset up**).

    The **asset picker** opens.

    ![Select UI page](media/select-UI-page.png)

4. Select the UI page you want to add and click **OK**. 

    For information about how to create and edit UI pages, see the [Editor](editor.md) page.

> [!Tip]
> To stop the UI obscuring the rest of the scene in the editor, in the property grid, disable the UI component.

> ![Disable UI component](media/disable-UI-component.png)

> Remember to enable the component again before you run the game.

## UI component properties

note - if you disable billboard mode, text is broken

we recommend you always use full screen as other stuff is broken

fixed size is broken

## UI scripts

To make UIs interactive, you need to add a script. Without scripts, UIs are simply non-interactive images. For more information, see [UI scripts](ui-scripts.md).

## UI pages

A **UI page** is a collection of UI elements. A UI page is equivalent to a scene, and UI elements to entities in a scene. Elements can have parents and children, just like entities. 

Like scenes, each UI page opens in its own UI editor tab.

### Create a UI page

In the **asset view**, click **Add asset > UI > UI page**.

![Add UI page](media/add-ui-page.png)

Game Studio adds the UI page to the asset view.

![Added UI page](media/added-ui-page.png)

#### Create a UI page from a UI element

1. Select the element or elements.

2. Right-click and select **Create page from selection**.

![Create page from selection](media/create-page-from-selection.png)

Game Studio creates a page with a copy of the element(s) you selected.

### Assign a UI page

You can assign a UI page to the `Page` property of a UI component.

```cs
// This property can be assigned from a UI page asset in Game Studio
public UIPage MyPage { get; set; }

protected override void LoadScene()
{
    InitializeUI();
}

public void InitializeUI()
{
    var rootElement = MyPage.RootElement;
    // to look for a specific element in the UI page, extension methods can be used
    var button = rootElement.FindVisualChildOfType<Button>("buttonOk");

    // if there's no element named "buttonOk" in the UI tree or the type doesn't match,
    // the previous method returns null
    if (button != null)
    {
        // attach a delegate to the Click event
        button.Click += delegate
        {
            // do something here...
        };
    }

    // assign the page to the UI component
    var uiComponent = Entity.Get<UIComponent>();
    uiComponent.Page = MyPage;
}
```