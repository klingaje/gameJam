// Start the game music on a loop.
audio_play_sound(snd_music_game, 0, true);


global.timeInGameMin = 0;
global.timeInGamesec = 0;
global.bossSpawnCooldown = 0;
alarm[0] = 60;
alarm[1] = 3600;
// Set the flag to say the game is not paused
global.paused = false;

// Set the experience goal to reach the next level.
global.xp_goal = 10;

// Set current experience.
global.xp = 0;

// Set the current level.
global.level = 1;

// Set the cooldown time for spawning enemies.
global.enemy_spawn_speed = 60;
global.trap_spawn_speed = 650;
global.trap_despawn_speed = 700;

// Set starting enemy health bonus.
// This is a multiplier, and is increased each wave.
// Result: enemy hp = enemy base hp * health bonus.
global.enemy_health_bonus = 1;

// Create the hero in the center of the room.
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_hero);

// Execute the shooting weapon reset function,
// initializing values for that weapon.
weapon_shooting_reset();

// Execute the swipe weapon reset function,
// initializing values for that weapon.
weapon_swipe_reset();

// Execute the trail weapon reset function,
// initializing values for that weapon.
weapon_trail_reset();

// Create the pause button.
instance_create_layer(1820, 20, "UpgradeScreen", obj_pause_button);

// Sets cooldown for enemy spawning time (from frames to seconds).
spawn_enemy_cooldown = global.enemy_spawn_speed;
spawn_trap_coodlown = global.trap_spawn_speed;
spawn_trap_despawn = global.trap_despawn_speed;

// Function handles enemy spawning.
spawn_enemy = function()
{
	// Reset cooldown.
	spawn_enemy_cooldown = global.enemy_spawn_speed;
	spawn_trap_coodlown = global.trap_spawn_speed;
	spawn_trap_despawn = global.trap_despawn_speed;

	// If the game is paused
	if (global.paused)
	{
		// Exit event, stopping any enemies from spawning.
		exit;
	}

	// Declare a temp variable to hold an enemy type.
	// By default this will be the pumpkill enemy.
	var _enemy = obj_pumpkill;
	var _trap = obj_spiderweb;

	// If we are over level 2...
	if (global.level > 2)
	{
		// Change the enemy type to either
		// pigun or pumpkill.
		_enemy = choose(obj_pigun, obj_pumpkill);
	}

	// If we are over level 4...
	if (global.level > 4)
	{
		// Change the enemy type to either
		// pigun, pumpkill or rooster.
		_enemy = choose(obj_pigun, obj_pumpkill, obj_rooster);
		_trap = choose(obj_spiderweb, obj_carplant);
	}
	
	if (global.level > 6)
	{
		// Change the enemy type to either
		// pigun, pumpkill or rooster.
		_enemy = choose(obj_pigun, obj_pumpkill, obj_rooster, obj_bird);
		_trap = choose(obj_spiderweb, obj_carplant);
	}

	// We want to spawn enemyes around the player.
	// So we first get a random direction (0 to 360).
	var _dir = random(360);

	// Then we get the position 1200 pixels away
	// from the hero on the x axis.
	var _x = obj_hero.x + lengthdir_x(1200, _dir);

	// Then we get the position 1200 pixels away
	// from the hero on the y axis.
	var _y = obj_hero.y + lengthdir_y(1200, _dir);
	
	// Set a baseline variable to track how far the ray has to go to be outside the camera's view
	var _i = 1;
	
	// Find if the spawn point is within the camera's view (plus a border of 100 units for the sprites)
	// If it is, move it further so it is outside the view
	while(camera_get_view_x(view_camera[view_current]) - 100 < _x &&  _x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 100 &&
		camera_get_view_y(view_camera[view_current]) - 100 < _y &&  _y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 100)
	{
		// Reset the spawn coordinates to 400 units further in that direction
		_x = obj_hero.x + lengthdir_x(1200 + _i * 400, _dir);
		_y = obj_hero.y + lengthdir_y(1200 + _i * 400, _dir);
		
		// Increase the number of increments have been needed
		_i++;
	}
	
	
	var _distance = random_range(600, 1800)
	var _a = obj_hero.x + lengthdir_x(_distance, _dir);

	// Then we get the position 1200 pixels away
	// from the hero on the y axis.
	var _b = obj_hero.y + lengthdir_y(_distance, _dir);
	
	// Set a baseline variable to track how far the ray has to go to be outside the camera's view
	var _c = 1;
	
	// Find if the spawn point is within the camera's view (plus a border of 100 units for the sprites)
	// If it is, move it further so it is outside the view
	while(camera_get_view_x(view_camera[view_current]) - 100 < _x &&  _x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 100 &&
		camera_get_view_y(view_camera[view_current]) - 100 < _y &&  _y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 100)
	{
		// Reset the spawn coordinates to 400 units further in that direction
		_a = obj_hero.x + lengthdir_x(1200 + _c * 400, _dir);
		_b = obj_hero.y + lengthdir_y(1200 + _c * 400, _dir);
		
		// Increase the number of increments have been needed
		_c++;
	}

	// Create an enemy at that generated positon.
	instance_create_layer(_x, _y, "Instances", _enemy);
	var trap_instance = instance_create_layer(_a, _b, "Instances", _trap);
	trap_instance.alarm[0] = spawn_trap_despawn;
}