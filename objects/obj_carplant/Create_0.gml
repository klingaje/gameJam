/// @description Insert description here
// You can write your code in this editor
image_xscale = 4;
image_yscale = 4;

var _shadow = instance_create_layer(x, y, "Shadows", obj_shadow);
// Set shadow owner.
_shadow.owner_object = self;