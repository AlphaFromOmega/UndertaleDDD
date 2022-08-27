

if (triggered && !disabled)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y +  earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	bul.type = BULLET_TYPE.ORANGE;
	var angle = random_range(-135, -45);
	bul.velocity.x = lengthdir_x(12, angle);
	bul.velocity.y = lengthdir_y(12, angle);
	bul.damage = 0;
}
if (disabled && !instance_exists(par_bullet))
{
	event_user(15)
}