# Collider shapes

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Designer</span>

For [colliders](colliders.md) to interact, you need to select an entity and set its shape in the **Property grid**. The shape can be different from the entity's other components (such as its model). Components can have multiple intersecting shapes. Each shape has additional properties including size, orientation, offset, and so on.

You can specify a geometric shape, or generate a shape based on a model you select.

## Box

| Property       | Description |
| -------------- |-------------| 
| Is 2D | Makes the box infinitely flat in one dimension. |
| Size    | The box size in XYZ values. |
| Local offset     | The box position relative its entity.|
| Local rotation      | The box rotation in XYZ values.|

## Capsule

The capsule shape is especially useful for character components, as its curved base lets the entity move to higher planes (eg when climbing staircases).

| Property       | Description |
| -------------- |-------------| 
| Is 2D | Makes the capsule infinitely flat in one dimension.|
| Length | The length of the capsule.|
| Radius | The radius of the capsule.|
| Orientation | The axis along which the shape is stretched (X, Y, or Z).|
| Local offset     | The capsule position relative to its entity.|
| Local rotation      | The capsule rotation in XYZ values.|

## Cone

| Property       | Description |
| -------------- |-------------| 
| Height | The height of the cone.|
| Radius | The radius of the cone at the bottom end.|
| Orientation | The axis along which the shape is stretched (X, Y, or Z).|
| Local offset     | The cone position relative to its entity.|
| Local rotation      | The cone rotation in XYZ values.|

## Cylinder

| Property       | Description |
| -------------- |-------------| 
| Height | The length of the cylinder.|
| Radius | The radius of the cylinder.|
| Orientation | Sets the axis along which the shape is stretched (X, Y, or Z).|
| Local offset     | The cylinder position relative to its entity.|
| Local rotation      | The cylinder  rotation in XYZ values.|

## Sphere

| Property       | Description |
| -------------- |-------------| 
| Is 2D | Makes the sphere infinitely flat in one dimension. |
| Radius | The radius of the sphere.|
| Local offset     | The sphere position relative to its entity.|

## Infinite plane

The infinite plane covers an infinite distance across one dimension.
Think of it like a wall or floor stretching into the distance for ever.
You can use several infinite planes together to box users in and stop them "tunneling" outside the level.

| Property       | Description |
| -------------- |-------------| 
| Normal  | Which vector (X, Y, or Z) is perpendicular to the plane. For example, to make an infinite floor, set the normal property to: _X:0, Y:1, Z:0_. |
| Offset     | The plane position relative to its entity.|

## Asset

This generates a collider shape from a model asset.

| Property       | Description |
| -------------- |-------------| 
| Shape | The model asset used to generate the collider shape.|

## Show collider shapes at runtime
You can make collider shapes visible at runtime, which is useful for debugging problems with physics. To do this, use:

``
this.GetSimulation().ColliderShapesRendering = true;
``

To show or hide collider shapes at runtime with a keyboard shortcut, use the **DebugPhysicsShapes** script.

1. In the **Asset view**, click **Add asset**.
2. Select **Scripts** > **Debug Physics Shapes**.
3. Add the **Debug Physics Shapes** script as a component to an entity in the scene.

The script binds the collider shape visibility to **Left Shift + Left Ctrl + P**, so you can turn it on and off at runtime.
You can edit the script to bind a different key combination.

> [!Note]
> Collider shapes for infinite planes are always invisible.

## See also
* [Colliders](colliders.md)
* [Tutorial: Create a bouncing ball](create-a-bouncing-ball.md)
* [Tutorial: Script a trigger](script-a-trigger.md)