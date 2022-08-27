

audio_stop_sound(sfx_fire_tan)
audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
var rallyMod = (rallysCompleted % 2) ? -1 : 1;
var baseAngle = -90 + (rallyMod * -100) + (shot * 10 * rallyMod);
for (var i = 0; i < 3; i++;)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y +  earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	bul.type = BULLET_TYPE.CYAN;
	
	bul.velocity.x = lengthdir_x(8, baseAngle) + random_range(-0.25, 0.25);
	bul.velocity.y = lengthdir_y(8, baseAngle) + random_range(-0.25, 0.25);
	bul.damage = 0;
}
shot++;

if (shot >= 20)
{
	shot = 0;
	rallysCompleted++;
}
if (rallysCompleted < 5)
{
	alarm[0] = 3;
}