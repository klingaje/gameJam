if (global.paused)
{
	// Exit this event while paused.
	exit;
}

// Set depth to negative y.
// This will cause instances to draw from
// the top of the screen to the bottom, mimicking a 3/4 camera angle.
depth = -y;

// Set direction towards the hero.
direction = point_direction(x, y, obj_hero.x, obj_hero.y);

// If horizontal speed is NOT 0.
if(hspeed != 0)
{
	// Set our xscale to the sign of hspeed
	// (can only be -1 or 1 at this point).
	image_xscale = sign(hspeed);
}



nearest_enemy = instance_nearest(x, y, obj_hero);
nearest_distance = 2000;


// If an enemy instance is found.
if (nearest_enemy)
{
	// Get the distance to that enemy.
	nearest_distance = point_distance(x, y, nearest_enemy.x, nearest_enemy.y);
}

// Reduce cooldown timer for attacks.
boss_shoot_cooldown--;

// Check if function cooldown is finished.
if (boss_shoot_cooldown <= 0)
{
	// Call function.
	boss_shoot();	
}