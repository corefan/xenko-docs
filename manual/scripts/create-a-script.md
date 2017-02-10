# Create a script

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Programmer</span>

You can create and add scripts using Game Studio or Visual Studio.

## Create a script in Game Studio

1. In the **asset view**, click **Add asset > Scripts** and select a script type.

	![Select script type window](media/create-a-script-script-asset-selection.png)

2. In the **Script wizard** dialog, specify a class name and namespace for the script and click **OK**.

	![Script wizard](media/script-wizard.png)

Game Studio adds a script to the project. You can see it in the **asset view**.

![New script on Asset view tab](media/create-a-script-new-script-asset-view.png)
  
You can see the new script in Visual Studio.

> [!Tip]
> To open your solution in Visual Studio, click the ![Open in IDE](media/create-a-script-ide-icon.png) (**Open in IDE**) icon in the Game Studio toolbar.

```
using System;
using System.Text;
using System.Threading.Tasks;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Xenko.Input;
using SiliconStudio.Xenko.Engine;

namespace MyGame
{
	public class BasicAsyncScript : AsyncScript
	{	
		public override async Task Execute()
		{
			while(Game.IsRunning)
			{
				// Do some stuff every frame
				await Script.NextFrame();
			}
		}
	}
}
```

## Create a script in Visual Studio

1. In Game Studio, open your solution in Visual Studio by clicking the ![Open in IDE](media/create-a-script-ide-icon.png) (**Open in IDE**) icon in the toolbar.

	The game solution is composed of several projects. 
	
	* The project ending in *.Game* is the main project, and should contain all your game logic and scripts. 
	* Other projects (eg *MyGame.Windows*, *MyGame.Android* etc) contain platform-specific code.

	For more information about project structure, see [Project structure](../get-started/project-structure.md).

2. Add a new class file to the `.Game` project. To do this, right-click the project ands elect **Add > New Item**.

	The **Add New Item** dialog opens.

3. Select **Class**, type a name for your script, and click **Add**.

   Visual Studio adds a new class to your game.

4. In the file you created, make sure the script is public and derives from either **AsyncScript** or **SyncScript**.

5. Implement the necessary abstract methods.

	Example:

	```
		using System;
		using System.Text;
		using System.Threading.Tasks;
		using SiliconStudio.Core.Mathematics;
		using SiliconStudio.Xenko.Input;
		using SiliconStudio.Xenko.Engine;
		
		namespace MyGame
		{
			public class SampleSyncScript : SyncScript
			{			
				public override void Update()
				{
					if (Game.IsRunning)
					{
						// Do some stuff every frame
					}
				}
			}
		}
	```

6. Save the project and script files.

7. Because you modified the script, Game Studio needs to reload the assembly to show the changes.
   
	![Confirmation message](media/create-a-script-confirmation-message.png)

	Click **Yes**.

   Game Studio adds your class script to your component list.

8. In the solution explorer, select the assembly that contains your script.
   Game Studio displays the script in the asset view, ready to be used.

## See also

* [Create a script](create-a-script.md)
* [Types of script](types-of-script.md)
* [Add a script](add-a-script.md)
* [Create a script](create-a-script.md)
* [Debugging](debugging.md)