# Shadow optimization

The technique used to render shadows is called **shadow mapping**. It involves rendering all potential occluders to a depth texture from the point of view of the light, then reusing this information to render the shadows along with the rest of the scene.

Internally, Xenko uses a shadow map atlas texture for directional and spot lights. Each light with an enabled shadow uses a region of this map atlas texture. The size of each region depends on several factors:

- The `shadowMapSizeFactor` based on the `LightShadowMap.Size` property:

| Shadow size | Shadow importance factor             |
| ----------- | ------------------------------------ |
| XLarge      | 2.0                                  |
| Large       | 1.0 (default for directional lights) |
| Medium      | 0.5 (default for spot lights)        |
| Small       | 0.25 (default for omni lights)       |
| XSmall      | 0.125                                |

- The projected size of the light in screen-space (`lightSize`). 
  - For directional lights, the lightSize is equal to the max (screenWidth, screenHeight)
  - For spot lights, the lightSize is equal to the projection of the projected sphere at target spot light cone
- The `ShadowMapBaseSize` equals `1024`.

The final size of the shadow map is calculated like this:

```cs
// Calculate the size factor
var shadowMapSizeFinalFactor = shadowImportanceFactor * shadowMapSizeFactor;
// Multiply the light projected size by the size factor
var shadowMapSize = NextPowerOfTwo(lightSize * shadowSizeFinalFactor);
// Clamp to a maximum size
shadowMapSize = min(shadowMapSize, ShadowMapBaseSize  * shadowSizeFinalFactor);
```