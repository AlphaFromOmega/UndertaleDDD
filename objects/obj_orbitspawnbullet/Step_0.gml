


// Inherit the parent event
event_inherited();

if (life % (orbitSpeed/4) == 0)
{
	var bul = instance_create_depth(x + random_range(-1, 1), y + random_range(-8, 8), depth - 1, obj_fadebullet)
	bul.sprite_index = spr_tutorial_bullet
	bul.image_angle = image_angle
	bul.image_xscale = image_xscale
	bul.image_yscale = image_yscale
	bul.persists = true
	bul.damage = damage
}
