
# Compile shaders

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Programmer</span>

Xenko converts shaders into the shader language used by the [graphics platform](../platforms/set-the-graphics-platform.md).

| Platform       | Shader language 
| -------------- | ---- 
| Direct3D       | HLSL
| OpenGL         | GLSL
| Vulkan         | SPIR-V
| iOS            | OpenGL ES

Xenko can convert the shaders at runtime (when the game is running) or at build time (when the editor builds the game assets).

When Xenko generates shaders at runtime, rendering stops until the shader is compiled and the frame can be rendered. This is usually something you want to avoid in your release build, especially on mobile platforms, which have less CPU.

## How Xenko converts shaders at runtime

Xenko can't know which shaders will be used at runtime. This is because users might generate new shader permutations by, for example, changing material parameters or modifying post-effect parameters from scripts. Additionally, the final shaders depend on the graphics features on the execution platform.

1. When Xenko needs a new shader at runtime, it checks its database to see if the shader has already been converted. If the shader is in the database, Xenko uses it.

2. If the shader hasn't already been converted, Xenko compiles it — either locally (on the device) or remotely (in Game Studio), depending on the package **user settings** (see below).

3. If **Record used effects** is enabled in the package **User Settings** (see below), Xenko notifies Game Studio that it needs a new shader.

4. Game Studio notifies you that there are new shaders to import.

    ![New effects](media/new-effects-to-import.png)

    In the **Asset view**, the **Import effects** button becomes available.

    ![Import effects](media/import-effects-button.png)

5. If you click **Import effects**, Game Studio updates the **Effect Log** (or creates it if it doesn't exist) and adds them to the game database to be used the next time you build (see step 1).

    ![Effect log](media/effect-log.png)

## Change the shader compilation settings

1. In Game Studio, in the **Solution explorer**, select the package and click **Package properties**.

    ![Package properties](media/package-properties-button.png)

2. In the **Property grid**, set the properties.

    ![Package properties](media/package-properties.png)

The **Effect compiler** property specifies how to compile the shader.

* **Local**: convert the shader on the device. This is recommended for release versions of your game.

* **Remote**: convert the shader on the developer machine. We don't recommend this for release versions of your game, as it can't connect to the developer machine. It won't cause errors, but it's pointless.

* **LocalOrRemote**: convert the shader on the developer machine; if this fails, try to convert it on the device. Like the **Remote** setting, we don't recommend this for release versions of your game, as it can't connect to the developer machine.

* **None**: Don't convert shaders. Note that the application will crash if it requires a shader that isn't in the database. Currently, using this feature doesn't save any space your application, so there's no advantage in using it; however, it might be useful for making sure you have every shader in the database.

If you enable **Record used effects**, Game Studio adds new shaders to the Effect Log as soon as they're needed. We don't recommend this for release versions of your game, as it can't connect to the developer machine.

## Compile shaders remotely when developing for iOS

As iOS devices can't connect directly to PC, to convert Xenko shaders remotely when developing for iOS, you need to use a Python script as a relay between the device, a Mac, and the developer PC.

1. Make sure your PC and Mac are connected to the same network.

2. On your Mac, install Python. You can download Python from the [Python site](https://www.python.org/downloads/).

3. Download and unzip [ios-tcreplay.zip](ios-tcreplay.zip).

4. Open **Terminal**, navigate to the folder where you unzipped the file, and execute **xenko-ios-relay.py MyPcName**, where **MyPcName** is the name of your developer PC.

    [!Tip]
    [To find the name of your developer PC, on the PC, press the Windows key, type **About**, and press **Enter**. The PC name is listed under **PC name**.]

The iOS device should now be able to communicate with the PC via your Mac to build shaders remotely.

## Error messages

If your application tries to connect to Game Studio to compile a shader or to notify Game Studio that it needs new shaders, but can't connect, the following error is displayed (WHERE?):

"[RouterClient]: Error: Could not connect to connection router using mode Connect. System.AggregateException: One or more errors occurred. ---> System.Net.Sockets.SocketException: No connection could be made because the target machine actively refused it 127.0.0.1:31254"