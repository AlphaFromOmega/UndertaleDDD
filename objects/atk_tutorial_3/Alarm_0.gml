

var bul = instance_create_depth(bb.x - bb.boxScale.x/2, bb.y + bb.boxScale.y/2 - 80, bb.depth - 10, obj_tutorial_phaser);
bul.velocity.x = 2;
bul.damage = 0;

shot++;
if (shot < 3)
{
	alarm[0] = room_speed * 2;
}
else
{
	alarm[1] = room_speed * 4;
}