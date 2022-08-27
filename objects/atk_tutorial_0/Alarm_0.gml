

audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
var amount = 13 + modulate;
for (var i = 0; i < amount; i++;)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	var offset = 10;
	var angle = -90 + (i + amount/2 - amount) * offset + offset/2;
	
	bul.velocity.x = lengthdir_x(8, angle);
	bul.velocity.y = lengthdir_y(8, angle);
	
	bul.damage = 0;
}

modulate = 1 - modulate;
shotsFire++;
if (shotsFire < 8)
{
	alarm[0] = room_speed;
}