# Requirements

To develop for Linux using Xenko you need a Linux PC with a graphic cards supporting at least OpenGL 4.2 or Vulkan 1.0. The Xenko preferred Linux distribution is Ubuntu 16.04 as this is the setup used by the Xenko team to develop the Linux version. We are not strictly dependent on this version of Ubuntu, therefore any later versions or any other Linux distributions should also work.

All setup instructions will be written assuming you have Ubuntu 16.04 installed, please adapt accordingly to your Linux distribution.

You will also need a Windows PC to build your projects for Linux using GameStudio.

## Setup

You will need the following packages:
* [FreeType](#freetype)
* [OpenAL](#openal)
* [SDL2](#sdl2)
* Mono or .NET Core: one of them needs to be installed and it is ok to install both

## FreeType

To render font, we use the [FreeType](https://www.freetype.org/) library. The minimum required version is 2.6 and can be installed via:

```
sudo apt-get install libfreetype6-dev
```

## OpenAL

To play sounds and music, we use the [OpenAL](https://www.openal.org/) library. It can be installed via:

```
sudo apt-get install libopenal-dev
```

## SDL2

To run games on Linux, we use the [SDL2](https://www.libsdl.org/) library which provides us the ability to create windows, handle mouse, keyboard and joystick events. The minimum required version is 2.0.4 and can be installed via:

```
sudo apt-get install libsdl2-dev
```

## Mono

To install Mono, please refer to the [Mono Project](http://www.mono-project.com/docs/getting-started/install/linux/) installation instructions for Debian/Ubuntu. Make sure version 4.4 is installed. You can verify this by typing after installing it:

```
mono --version
```


### .NET Code

To install .NET Core, please refer to the [.NET Core](https://www.microsoft.com/net/core#ubuntu) installation instructions for Debian/Ubuntu. Make sure version 1.0 is installed. You can verify this by typing after installing it:

```
dotnet --version
```
