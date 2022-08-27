

var rot = rots[shot div 4]
var bul = instance_create_depth(soul.x + lengthdir_x(distance, rot), soul.y + lengthdir_y(distance, rot), bb.depth - 10, obj_tutorial_spear)
bul.velocity.x = lengthdir_x(8, rot - 180)
bul.velocity.y = lengthdir_y(8, rot - 180)
bul.damage = 0;

shot++
if (shot % 4 > 0)
{
	alarm[0] = 20
}
else if (shot div 4 < array_length(rots))
{
	alarm[0] = 60
}
else
{
	del = true
}