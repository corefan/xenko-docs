# Add a UI to a scene

After you create a [UI page](ui-page.md), add it to the scene as a component on an entity.

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

    For information about how to create and edit UI pages, see the [UI editor](ui-editor.md) page.

> [!Tip]
> To stop the UI obscuring the rest of the scene in the editor, disable the **UI component** in the property grid.

> ![Disable UI component](media/disable-UI-component.png)

> Remember to enable the component again before you run the game. If you don't, Xenko doesn't display the UI.

### Assign a UI page to a UI page component in code

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

## UI component properties

| Property           | Description
|--------------------|----------------
| Page               | The UI page displayed by the component
| Full screen        | **Note:** We recommend you use this as other stuff is broken
| Resolution         | The UI resolution in pixels
| Size               | 
| Resolution stretch | 
| Billboard          | if you disable billboard mode, text is broken
| Snap text          | 
| Fixed size         | Broken
| Render group       | 

## UI scripts

To make UIs interactive, you need to add a script. Without scripts, UIs are simply non-interactive images. For more information, see [UI scripts](ui-scripts.md).

## See also 

