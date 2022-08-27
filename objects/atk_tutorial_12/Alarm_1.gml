

var dir = -((((shotsFired div 5) % 2) * 2) - 1)

earnaro.sprite_index = spr_tutorial_earnaro_fire
var bul = instance_create_depth(bb.x + bb.boxScale.x/2 * dir, get_net_pos(shotsFired % 2, net), bb.depth-50, obj_tutorial_bullet_onboard);
bul.velocity.x = -4 * dir;
bul.image_yscale = 2
bul.damage = earnaro.atk

shotsFired++;

if (shotsFired < 10)
{
	alarm[1] = 60
}