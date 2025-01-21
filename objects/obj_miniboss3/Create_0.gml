// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
speed = 4;
hitpoints_max = 25 * global.enemy_health_bonus;
// Set sprites for this enemy type.

image_xscale = 10;
image_yscale = 10;
image_blend = make_color_rgb(255, 100, 100);