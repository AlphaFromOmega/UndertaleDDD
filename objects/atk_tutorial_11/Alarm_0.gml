/// @description Trail Fire

var bul = noone

for (var i = 0; i < MAX_BULLETS; i++;)
{
	var rot = 90 + i * MAX_TURN/MAX_BULLETS
	var dis = distance + i * 96
	bul = instance_create_depth(bb.boxPosDest.x + lengthdir_x(dis, rot), bb.boxPosDest.y + lengthdir_y(dis, rot), bb.depth - 10, obj_tutorial_spear)
	bul.velocity.x = lengthdir_x(8, rot - 180)
	bul.velocity.y = lengthdir_y(8, rot - 180)
	bul.damage = earnaro.atk
	bul.sprite_index = spr_tutorial_bullet3
}

lastBullet = bul
created = true
