

for (var i = 0; i < 2; i++;)
{
	var bul = instance_create_depth(bb.x + bb.boxScale.x/2, get_net_pos(i * 2, net), bb.depth-50, obj_tutorial_bullet_onboard);
	bul.velocity.x = -1;
}
var bul = instance_create_depth(bb.x - bb.boxScale.x/2,  get_net_pos(1, net), bb.depth - 50, obj_tutorial_bullet_onboard);
bul.velocity.x = 2;
bul.damage = 0;
if (bullets < 8)
{
	alarm[0] = 90;
	bullets++;
}
else
{
	alarm[1] = 60;
}