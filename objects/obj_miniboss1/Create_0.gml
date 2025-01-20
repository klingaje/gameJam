// Call parent event to set up general enemy stuff.
event_inherited();

// Set max hitpoints specifically for this enemy type.
hitpoints_max = 30 * global.enemy_health_bonus;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;

// Set sprites for this enemy type.
//walk_sprite = spr_pigun_walk;
//attack_sprite = spr_pigun_attack;
//hit_sprite = spr_pigun_hit;

image_xscale = 10;
image_yscale = 10;

image_blend = make_color_rgb(255, 100, 100);