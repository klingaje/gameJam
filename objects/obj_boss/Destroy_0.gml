// Decide what drop to use
// By default it should be a regular collectable
var _drop = obj_collectable;

// However, there is a 1/10 chance to replace it with a heart instead
// Because computers start countin at 0, the maximum value must be 9 for a 1/10 chance
if(irandom(9) == 0)
{
	_drop = obj_heart
}

// Create the chosen drop.
for (var i = 0; i < 40; i++) {
    var offset_x = random_range(-10, 10);  // Random horizontal offset between -10 and 10
    var offset_y = random_range(-10, 10);  // Random vertical offset between -10 and 10
    instance_create_layer(x + offset_x, y + offset_y, "Instances", _drop);
}
