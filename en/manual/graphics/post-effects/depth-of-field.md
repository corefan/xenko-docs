# Depth of field

<span class="label label-doc-level">Intermediate</span>
<span class="label label-doc-audience">Artist</span>
<span class="label label-doc-audience">Programmer</span>

By default, rendering produces a very sharp image, which can look artificial. **Depth of field** effects simulate the behavior of a real camera lens focusing an object, leaving background and foreground objects out of focus.

![media/realworld_dof_agave_flowers.jpg](media/realworld_dof_agave_flowers.jpg) 

To create the effect, Xenko creates several versions of the original image with different intensities of blur, and interpolates between them. The more layers used, the better the quality, but at performance cost.

![media/depth-of-field-2.png](media/depth-of-field-2.png)

## Properties

| Property   | Description     
| ---------- | -------- 
| Size       | Size of the [bokeh (Wikipedia)](https://en.wikipedia.org/wiki/Bokeh), expressed as a factor of the image width so it's resolution-independent. The bigger the size, the worse the performance                                              
| DOF Areas  | Areas of the depth of field. There are three main zones defined by their distance from the camera: near out-of-focus area (from X to Y), in-focus area (from Y to Z), and far out-of-focus area (from Z to W) 
| Technique  | The technique affects both the performance and the shape of the bokeh.  <br>**Circular Gaussian** is fast but unrealistic. <br>![media/depth-of-field-3.png](media/depth-of-field-3.png) <br>**Hexagonal Triple Rhombi** is heavier than Gaussian. <br>![media/depth-of-field-4.png](media/depth-of-field-4.png) <br>**Hexagonal McIntosh** is the heaviest. <br>![media/depth-of-field-5.png](media/depth-of-field-5.png)   
| Auto Focus | Automatically updates the DOF areas so the camera focuses on the object at the center of the screen

## See also

* [Bloom](bloom.md)
* [Bright filter](bright-filter.md)
* [Color transforms](color-transforms/index.md)
* [Lens flare](lens-flare.md)
* [Light streaks](light-streaks.md)