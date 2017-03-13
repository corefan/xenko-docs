# Bright filter

The **bright filter** extracts the areas of an image which are the brightest. The bright pass in itself is not a post-effect, but its result is used later by other effects such as [bloom](bloom.md), [light streaks](light-streaks.md), and [lens flare](lens-flare.md).

![media/bright-filter-1.png](media/bright-filter-1.png) 

## Properties

| Property  | Description                                                                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Threshold | Influences the threshold used to determine if a color passes or fails the bright filter.                                                       |
| Color     | Color modulator: the result of the bright filter is modulated by this color value, then affects the color other post-effects.  |
|           |                                                                                                                                                |
|           | If set to white, the color isn't modified.                                                                                                    |

## In this section

* [Bloom](bloom.md)
* [Color transforms](color-transforms/index.md)
* [Depth of field](depth-of-field.md)
* [Lens flare](lens-flare.md)
* [Light streaks](light-streaks.md)
* [Post-effects for developers](post-effects-for-developers.md)