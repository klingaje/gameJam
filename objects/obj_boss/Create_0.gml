// Call parent event to set up general enemy stuff.
event_inherited();

// Set max hitpoints specifically for this enemy type.
hitpoints_max = 50 * global.enemy_health_bonus;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;
nearest_enemy = obj_hero;
nearest_distance = 2000;

// Set sprites for this enemy type.
walk_sprite = spr_boss;
attack_sprite = spr_boss;
hit_sprite = spr_boss;

boss_shoot_cooldown = 50;

boss_shoot = function()
{
	// If the nearest enemy is within 1000 pixels...
	if (nearest_distance < 1500)
	{
		// Reset the cooldown for this weapon.
		boss_shoot_cooldown = max(global.boss_shooting[? "attack_speed"], 1);

		// If this weapon is unlocked...
		if (global.boss_shooting[? "unlocked"])
		{
			// Execute the function to handle this weapon.
			shooting_attack_boss();
		}
	}
	// The nearest enemy is too far away, but we don't want to fully reset the cooldown...
	else
	{
		// Set the cooldown to test again next frame.
		boss_shoot_cooldown = 1;
	}
}

image_xscale = 1.5;
image_yscale = 1.5;

//image_blend = make_color_rgb(255, 100, 100);