# Xbox Live

This page explains how to configure your project to work with Xbox Live.

## 1. Before you start

1. Make sure your project uses UWP as a platform. To do this, you can either:

    * [create a project](../../get-started/create-a-project.md) and select **UWP** as a platform, or
    * [add **UWP** as a platform to an existing project](../add-or-remove-a-platform.md)

    For this tutorial, you might find it useful to create a new project to test the process, then apply the knowledge to your existing projects.

2. Make sure you can run the project from UWP. To do this, in Visual Studio, select the platform you want (UWP-64, UWP-32, or UWP-ARM) from the **Solution Platform** drop-down list, and run the project.

3. Download the Xbox Live SDK.

    >[!Note]
    >To write this page, we used XboxLiveSDK-1612-20170114-002. The sample is loosely based on the Achievements sample in the Xbox Live SDK.

4. Change your Xbox Live environment. In the **SDK** folder, under **Tools**, run:

    ```
    SwitchSandbox.cmd XDKS.1
    ```

    XDKS.1 is the sandbox used for the Microsoft samples.

    >[!Note] 
    >This blocks regular Xbox accounts and only permits developer accounts. To switch back, run: 
    
    >```
    >SwitchSandbox.cmd RETAIL
    >```
    
5. Make sure you can run the Achievements sample with your developer account.

## 2. Add the Xbox Live SDK to your solution

1. In Visual Studio, open your game solution.

2. Open the Package Manager Console (**Tools > NuGet Package Manager > Package Manager Console**).

3. In the **Default project** field, select your UWP project (eg *MyGame.UWP*).

	![Picture: MyGame.UWP](media/xboxlive01.png)

4. In the console, type:

    ```
    PM > Install-Package Microsoft.Xbox.Live.SDK.WinRT.UWP
    ```

    Visual Studio adds the NuGet package to your project. 

5. Make sure the package appears in the **References** list.

	![Picture: Package in list](media/xboxlive02.png)

## 3. Configure the UWP project

1. Delete *MyGame.UWP.TemporaryKey.pfx*.

2. Add *xboxservices.config* to your project.

    You can get this file from any Xbox Live SDK sample (eg the **Achievements** sample).
    Alternatively, you can copy the file content from here:

    ```
    {
    "TitleId" : 50450562,
    "PrimaryServiceConfigId" : "94730100-2018-46b8-900b-a41a0301d082"
    }
    ```

    If you want to publish your game, update xboxservices.config.
    
3. In the *xboxservices.config* properties, under **Build Action**, select **Content**, and under **Copy to Output Directory**, select **Always**.

	![Picture: Properties](media/xboxlive03.png)

4. Edit *Package.appxmanifest* with details relevant to your project.

5. Enable the capability *InternetClientServer*.

Here is a snippet of an example manifest using the Xbox Live Achievements sample:

```
<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="http://schemas.microsoft.com/appx/manifest/foundation/windows10" xmlns:mp="http://schemas.microsoft.com/appx/2014/phone/manifest" xmlns:uap="http://schemas.microsoft.com/appx/manifest/uap/windows10" IgnorableNamespaces="uap mp">
  <Identity Name="38133JasonSandlin.SimplifiedAchievements-XboxLiveS" Publisher="CN=21A176D6-65FC-40A6-A44A-7DC730DA0070" Version="1.7.0.0" />
  <mp:PhoneIdentity PhoneProductId="960de43b-8df3-45dd-8a52-f7287c255870" PhonePublisherId="00000000-0000-0000-0000-000000000000" />
  <Properties>
    <DisplayName>Xbox LIVE sign in Sample</DisplayName>
    <PublisherDisplayName>Silicon Studio</PublisherDisplayName>
    <Logo>Assets\StoreLogo.png</Logo>
  </Properties>
  <Dependencies>
    <TargetDeviceFamily Name="Windows.Universal" MinVersion="10.0.10240.0" MaxVersionTested="10.0.10240.0" />
  </Dependencies>
  <Resources>
    <Resource Language="x-generate" />
  </Resources>
  <Applications>
    <Application Id="App" Executable="$targetnametoken$.exe" EntryPoint="Achievements.App">
      <uap:VisualElements DisplayName="Xbox LIVE sign in Sample" Square150x150Logo="Assets\Logo.png" Square44x44Logo="Assets\SmallLogo.png" Description="Achievements" BackgroundColor="transparent">
        <uap:DefaultTile Wide310x150Logo="Assets\WideLogo.png">
        </uap:DefaultTile>
        <uap:SplashScreen Image="Assets\SplashScreen.png" />
      </uap:VisualElements>
    </Application>
  </Applications>
  <Capabilities>
    <Capability Name="internetClient" />
    <Capability Name="internetClientServer" />
  </Capabilities>
</Package>
```

## 4. Add user account scripts to your game

You need to enable Xbox Live capability in your game project without exposing the Xbox Live SDK. As *MyGame.UWP* already references *MyGame.Game*, we can't reference it. Instead, we can create an interface and implement it from the UWP project side.

>[!Note]
>There are several ways to do this. This page explains one method.

1. Add two interfaces to your game, `IAccountManager` and `IConnectedAccount`. 

2. On your UWP project (eg *MyGame.UWP*), implement the interfaces `public class XboxAccount : IConnectedAccount` and `public class XboxLiveAccountManager : IAccountManager`. 

3. Add the account factory to your game so you can access it later from a game script. In the `MyGameMainPage.xaml.cs`, add the following line:

    ```
    Game.Services.AddService(typeof(IAccountManager), new XboxLiveAccountManager());
    ```

    ![Picture: References](media/xboxlive04.png)

    The final script should look like this at minimum:

    ```
        public class LoginScript : AsyncScript
        {
            private IConnectedAccount account;

            public override async Task Execute()
            {
                var accountMgr = Services.GetServiceAs<IAccountManager>();
                account = accountMgr?.CreateConnectedAccount();
			    if (account == null)
				    return;

                var result = account.LoginAsync();
			
	    		// TODO Add your code here!
            }
        }
    ```

Now you can expose the `xbox_live_user` functionality and other classes in your game.

![Picture: Property grid](media/xboxlive05.png)

## Sample project

* [Download a sample project](media/XboxLiveSample.zip) with Xbox Live login functionality 

    ![Picture: Sample project](media/xboxlive08.png)

## See also

* [Platforms](../index.md)