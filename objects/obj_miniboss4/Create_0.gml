 // Call parent event to set up general enemy stuff.
event_inherited();

// Set max hitpoints specifically for this enemy type.
speed = 3;
hitpoints_max = 40 * global.enemy_health_bonus;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;

// Set sprites for this enemy type.

image_blend = make_color_rgb(255, 100, 100);