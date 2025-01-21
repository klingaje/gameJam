// Call parent event to set up general enemy stuff.
event_inherited();

// Set max hitpoints specifically for this enemy type.
hitpoints_max = 50 * global.enemy_health_bonus;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;

image_xscale = 10;
image_yscale = 10;
image_blend = make_color_rgb(255, 100, 100);
// Set sprites for this enemy type.
