# Film grain

The **film grain** adds noise at each frame to simulate the grain of films used in real cameras.

![media/film-grain-1.png](media/film-grain-1.png) 

The pattern is procedurally generated and changes at each frame.

To simulate real film grain, the noise should be more visible in areas of medium light intensity, and less visible in bright or dark areas.

The pattern locally modifies the luminance of the pixels affected.

## Properties

![media/film-grain-2.png](media/film-grain-2.png) 

| Property         | Description                                                      
| ---------------- | -------------------
| Amount           | The strength of the effect
| Grain size       | The size of the grain
| Animate          | Change the procedural pattern each frame
| Luminance | How much the original pixel luminance is affected by the grain pattern

## See also

* [Gamma correction](gamma-correction.md)
* [ToneMap](tonemap.md)
* [Vignetting](vignetting.md)
* [Custom color transforms](custom-color-transforms.md)