# Textures and render targets

Xenko uses the @'SiliconStudio.Xenko.Graphics.Texture' class to interact with texture objects in code.

For more information about rendering to a texture, see [Render targets](../graphics-compositor/render-targets.md).

## Load a texture

To load a texture from an asset in Xenko, call this function:

### Code: Load a texture

```cs
// loads the texture called duck.dds (or .png etc.)
var myTexture = Content.Load<Texture>("duck");
```

This automatically generates a texture object with all its fields correctly filled.

## Create a texture

You can also create textures without any assets (eg to be used as render target). To do this, call the constructor of the @'SiliconStudio.Xenko.Graphics.Texture' class. See the @'SiliconStudio.Xenko.Graphics.Texture' class reference to get the full list of available options and parameters. Some texture formats might not be available on all platforms.

### Code: Create a texture

```cs
var myTexture = Texture.New2D(GraphicsDevice, 512, 512, false, PixelFormat.R8G8B8A8_UNorm, TextureFlags.ShaderResource);
```

## Render targets

### Create a render target

The @'SiliconStudio.Xenko.Graphics.GraphicsPresenter' class always provides a default render target and a depth buffer. They are accessible through the @'SiliconStudio.Xenko.Graphics.GraphicsPresenter.BackBuffer' and @'SiliconStudio.Xenko.Graphics.GraphicsPresenter.DepthStencilBuffer' properties. The presenter is exposed by the @'SiliconStudio.Xenko.Graphics.GraphicsDevice.Presenter' property of the @'SiliconStudio.Xenko.Graphics.GraphicsDevice'. However, you might want to use your own buffer to perform off-screen rendering or post-processes. As a result, Xenko offers a simple way to create textures that can act as render targets and a depth buffers.

### Code: Create a custom render target and depth buffer

```cs
// render target
var myRenderTarget = Texture.New2D(GraphicsDevice, 512, 512, false, PixelFormat.R8G8B8A8_UNorm, TextureFlags.ShaderResource | TextureFlags.RenderTarget);
 
// writable depth buffer
var myDepthBuffer = Texture.New2D(GraphicsDevice, 512, 512, false, PixelFormat.D16_UNorm, TextureFlags.DepthStencil);
```

>[!Note]
>Don't forget the flag @'SiliconStudio.Xenko.Graphics.TextureFlags.RenderTarget' to enable the render target behavior.
>
>Make sure that the PixelFormat is correct, especially for the depth buffer. Be careful of the available formats on the target platform.

### Use a render target

Once these buffers are created, you can can easily set them as current render targets.

### Code: Use a render target

```cs
// settings the render targets
CommandList.SetRenderTargetAndViewport(myDepthBuffer, myRenderTarget);
 
// setting the default render target
CommandList.SetRenderTargetAndViewport(GraphicsDevice.Presenter.DepthStencilBuffer, GraphicsDevice.Presenter.BackBuffer);
```

>[!Note]
>Make sure both the render target and the depth buffer have the same size. Otherwise, the depth buffer isn't used.

You can set multiple render targets at the same time. See the overloads of @'SiliconStudio.Xenko.Graphics.CommandList.SetRenderTargets(SiliconStudio.Xenko.Graphics.Texture,SiliconStudio.Xenko.Graphics.Texture[])' and @'SiliconStudio.Xenko.Graphics.CommandList.SetRenderTargetsAndViewport(SiliconStudio.Xenko.Graphics.Texture,SiliconStudio.Xenko.Graphics.Texture[])' method.

>[!Note]
>Only the @'SiliconStudio.Xenko.Graphics.GraphicsPresenter.BackBuffer' is displayed on screen, so you need to render it to display something.

### Clear a render target

To clear render targets, call the @'SiliconStudio.Xenko.Graphics.CommandList.Clear(SiliconStudio.Xenko.Graphics.Texture,SiliconStudio.Core.Mathematics.Color4)' and @'SiliconStudio.Xenko.Graphics.CommandList.Clear(SiliconStudio.Xenko.Graphics.Texture,SiliconStudio.Xenko.Graphics.DepthStencilClearOptions,System.Single,System.Byte)' methods.

### Code: Clear the targets

```cs
CommandList.Clear(GraphicsDevice.Presenter.BackBuffer, Color.Black);
CommandList.Clear(GraphicsDevice.Presenter.DepthStencilBuffer, DepthStencilClearOptions.DepthBuffer); // only clear the depth buffer
```

>[!Note]
>Don't forget to clear the @'SiliconStudio.Xenko.Graphics.GraphicsPresenter.BackBuffer' and the @'SiliconStudio.Xenko.Graphics.GraphicsPresenter.DepthStencilBuffer' each frame. If you don't, you might get unexpected behavior depending on the device. If you want to keep the contents of a frame, use an intermediate render target.

## Viewport

@'SiliconStudio.Xenko.Graphics.CommandList.SetRenderTargetAndViewport(SiliconStudio.Xenko.Graphics.Texture,SiliconStudio.Xenko.Graphics.Texture)' adjusts the current @'SiliconStudio.Xenko.Graphics.Viewport' to the full size of the render target.

If you only want to render to a subset of the texture, set the render target and viewport separately using @'SiliconStudio.Xenko.Graphics.CommandList.SetRenderTarget(SiliconStudio.Xenko.Graphics.Texture,SiliconStudio.Xenko.Graphics.Texture)' and @'SiliconStudio.Xenko.Graphics.CommandList.SetViewport(SiliconStudio.Xenko.Graphics.Viewport)'.

You can bind multiple viewports using @'SiliconStudio.Xenko.Graphics.CommandList.SetViewports(SiliconStudio.Xenko.Graphics.Viewport[])' and @'SiliconStudio.Xenko.Graphics.CommandList.SetViewports(System.Int32,SiliconStudio.Xenko.Graphics.Viewport[])' overloads for use with a geometry shader.

### Code: Set the viewports

```cs
// example of a full HD buffer
CommandList.SetRenderTarget(GraphicsDevice.Presenter.DepthStencilBuffer, GraphicsDevice.Presenter.BackBuffer); // no viewport set
 
// example of setting the viewport to have a 10-pixel border around the image in a full HD buffer (1920x1080)
var viewport = new Viewport(10, 10, 1900, 1060);
CommandList.SetViewport(viewport);
```

## Scissor

The @'SiliconStudio.Xenko.Graphics.CommandList.SetScissorRectangle(SiliconStudio.Core.Mathematics.Rectangle)' and @'SiliconStudio.Xenko.Graphics.CommandList.SetScissorRectangles(SiliconStudio.Core.Mathematics.Rectangle[])' methods set the scissors. Unlike the viewport, you need to provide the coordinates of the location of the vertices defining the scissor instead of its size.

### Code: Set the scissor

```cs
// example of setting the scissor to crop the image by 10 pixel around it in a full hd buffer (1920x1080)
var rectangle = new Rectangle(10, 10, 1910, 1070);
CommandList.SetScissorRectangles(rectangle);
 
var rectangles = new[] { new Rectangle(10, 10, 1900, 1060), new Rectangle(0, 0, 256, 256) };
CommandList.SetScissorRectangles(rectangles);
```

## See also

* [Render targets](../graphics-compositor/render-targets.md)