global.boss_shooting = ds_map_create();
weapon_boss_shooting_reset()
function weapon_boss_shooting_reset() 
{
	// Shooting weapon bases stats.
	// Shooting weapon starts unlocked as it's the first weapon.
	ds_map_replace(global.boss_shooting, "damage", 0.75);
	ds_map_replace(global.boss_shooting, "attack_speed", 60);
	ds_map_replace(global.boss_shooting, "number_of_shots", 3);
	ds_map_replace(global.boss_shooting, "unlocked", true);
}

// Create map to store the shooting weapon data.
global.hero_shooting = ds_map_create();

// Call function to reset the shooting weapon state.
weapon_shooting_reset();

// Define the function to reset the shooting weapon state.
function weapon_shooting_reset() 
{
	// Shooting weapon bases stats.
	// Shooting weapon starts unlocked as it's the first weapon.
	ds_map_replace(global.hero_shooting, "damage", 0.75);
	ds_map_replace(global.hero_shooting, "attack_speed", 30);
	ds_map_replace(global.hero_shooting, "number_of_shots", 1);
	ds_map_replace(global.hero_shooting, "unlocked", true);
}

// Define function to retrieve list of available shooting
// weapon upgrades.
function weapon_shooting_upgrades(_upgrade_list) 
{
	// Get wether the shooting weapon is unlocked.
	var _unlocked = ds_map_find_value(global.hero_shooting, "unlocked");

	// If the shooting weapon is NOT unlocked...
	if (!_unlocked)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to unlock shooting weapon.
		ds_map_replace(_map, "description", "Unlock Shooting\nWeapon");
		ds_map_replace(_map, "title", "UNLOCK");
		ds_map_replace(_map, "object", global.hero_shooting);
		ds_map_replace(_map, "key", "unlocked");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	
		// Exits the event.
		exit;
	}

	// Get current shooting weapon attack speed.
	var _attack_speed = ds_map_find_value(global.hero_shooting, "attack_speed");

	// If attack speed is over 5...
	if (_attack_speed > 1)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase attack speed of shooting weapon.
		ds_map_replace(_map, "description", "Increase Attack Speed");
		ds_map_replace(_map, "title", "SPEED");
		ds_map_replace(_map, "object", global.hero_shooting);
		ds_map_replace(_map, "key", "attack_speed");
		ds_map_replace(_map, "amount", -5);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	}

	// Get the current number of shots...
	var _number_of_shots = ds_map_find_value(global.hero_shooting, "number_of_shots");

	// If the number of shots is under 7...
	if (_number_of_shots < 700)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase the number of shots
		// from the shooting weapon.
		ds_map_replace(_map, "description", "Number of shots +2");
		ds_map_replace(_map, "title", "BARRAGE");
		ds_map_replace(_map, "object", global.hero_shooting);
		ds_map_replace(_map, "key", "number_of_shots");
		ds_map_replace(_map, "amount", 2);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	}

	// Get current shooting weapon damage.
	var _damage = ds_map_find_value(global.hero_shooting, "damage");

	// If damage is under 4...
	if (_damage < 400)
	{
		// Create map to strore the upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase damage.
		ds_map_replace(_map, "description", "Increase Damage + 50%");
		ds_map_replace(_map, "title", "DAMAGE");
		ds_map_replace(_map, "object", global.hero_shooting);
		ds_map_replace(_map, "key", "damage");
		ds_map_replace(_map, "amount", 0.5);
		ds_map_replace(_map, "icon", spr_shooting_attack_big);
		ds_map_replace(_map, "weapon_name", "PROJECTILE");
	
		// Add upgrade to list.
		ds_list_add(_upgrade_list, _map);
	}
}