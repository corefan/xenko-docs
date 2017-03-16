# Color transforms

**Color transforms** are special effects designed to be combined in a chain at runtime. You can define a series a color transforms to apply to an image. Each transform uses the previous transform's output as its own input. At runtime, the series of transforms is squashed into one shader and rendered in a single draw call for maximum performance.

## In this section

* [Film grain](film-grain.md)
* [Gamma correction](gamma-correction.md)
* [ToneMap](tonemap.md)
* [Vignetting](vignetting.md)