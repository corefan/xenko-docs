# Local reflections

**Local reflections** ... 

Local reflections are most obvious when they project bright spots onto other surfaces. The effect is especially striking in night scenes, which have high contrast, and in rainy conditions with lots of reflective surfaces and highlights. 

Notice how the vending machine lights are reflected in the ground surface in this screenshot:

In games without lightmaps or global illumination, objects don't interact with each other as they do in reality, making them appear as if they've simply been Photoshopped in. With local reflections, objects appear to be part of the world rather than having been placed arbitrarily. The effect gives objects a feeling of weight, and makes scenes feel more grounded.

To create local reflections, Xenko reflects the current rendered frame on itself. 

Local reflections aren't appropriate for every object. It's a **screenspace effect**, which means it only reflects images that are already on the screen; it doesn't reflect objects that are off-screen or obscured from the player by other objects. Put simply, if the player can't see an object at that moment, then the object isn't reflected.

This means local reflections work well in enclosed areas such as corridors and rooms, but less well in open spaces. They also work best on bumpy surfaces, whose chaotic properties hide imperfections in the reflection. They work less well on glossy, mirror-like surfaces, because you naturally expect these surfaces to reflect the whole world.

## Enable local reflections

