if (sprite_index != spr_hero_hit_1)
{
	// Reduce hitpoints.
	hitpoints -= global.boss_shooting[? "damage"];

	// Create a text popup.
	var _text = instance_create_layer(x, y, "UpgradeScreen", obj_text_popup);
	// Set text for popup.
	_text.text = 1;
	// Set colour for popup.
	_text.color = c_red;
	
	// Change sprite index to hit.
	sprite_index = spr_hero_hit_1;
	// Reset image index.
	image_index = 0;
	
	
	with (other) instance_destroy();
	
}