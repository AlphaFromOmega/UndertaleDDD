

audio_play_sound_volume(sfx_fire_explosion, 40, 1, VOLUME_TYPE.SFX, false)

var bulletType = clamp(fire[0], 0, 2);
var dir = ((fire[0] % 2) * 2) - 1;
for (var i = 0; i < 32; i++;)
{
	var rot = i * 360/32
	for (var j = 0; j < 32; j++;)
	{
		var bul = instance_create_depth(earnaro.x + lengthdir_x(64, rot), earnaro.y + earnaroHandOffset.y + lengthdir_y(64, rot), bb.depth - 10, obj_tutorial_bullet);
		var spd = random_range(4, 20);
		bul.orbitPoint = new Vector2(earnaro.x, earnaro.y + earnaroHandOffset.y);
		bul.orbitSpeed = 0;
		bul.radius = 128;
		bul.velocity.x = lengthdir_x(spd, rot + 225 * dir);
		bul.velocity.y = lengthdir_y(spd, rot + 225 * dir);
		bul.tagID = 1;
		bul.curvePostion = 0;
		bul.moveDir = dir;
		bul.type = bulletTypes[bulletType];
		bul.colour = bulletColours[bulletType];
		bul.sprite_index = spr_tutorial_bullet2
	}
}

fire[0]++;
if (fire[0] < 3)
{
	alarm[1] = 240;
}
else if (fire[0] == 3)
{
	alarm[1] = 1;
}
else
{
	alarm[2] = 240;
}