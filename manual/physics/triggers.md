# Triggers

<span class="label label-doc-level">Beginner</span>
<span class="label label-doc-audience">Designer</span>

If you set a collider to be a **trigger**, other colliders no longer bump into it. Instead, they pass through.

The trigger detects when colliders enter it, which you can use to script events. For example, you can detect when a player character enters a room, and use this in your script to trigger an event. For more information, see [Events](../scripts/events.md).

>[!Note]
>[Character colliders](characters.md) can't be used as triggers.

To make a trigger: 

1. Create a [collider](colliders.md).

2. In the **Property grid**, under the collider component properties, select **Is Trigger**.

![Select 'Is trigger'](media/triggers-select-is-trigger-checkbox.png)

You can see when something enters the trigger using the following code:

```cs
// Wait for an entity to collide with the trigger
                var firstCollision = await trigger.NewCollision();

                var otherCollider = trigger == firstCollision.ColliderA ? firstCollision.ColliderB : firstCollision.ColliderA;
```

For an example of how to use triggers, see the [Script a trigger](script-a-trigger.md) tutorial.

## See also

* [Tutorial: Script a trigger](script-a-trigger.md)
* [Colliders](colliders.md)
* [Collider shapes](collider-shapes.md)
* [Events](../scripts/events.md)