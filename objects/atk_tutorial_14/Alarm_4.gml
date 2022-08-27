

audio_stop_sound(sfx_fire_tan)
audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
var deg = 12;
var pos = new Vector2(earnaro.x, earnaro.y + earnaroHandOffset.y);

// I have sin-ed
var chaos = (1 + fire[1]/300);
for (var i = 0; i < 10; i++;)
{
	var tRot = ((i * deg) + rot + (sin(fire[1] / 16) * deg/2) / chaos) + random_range(-0.1, 0.1);
	var offset = (sin(fire[1] / 64) + 1) * 32 * chaos;
	var spd = 4 + sin(fire[1] / 32) * chaos;
	var bul = instance_create_depth(pos.x + lengthdir_x(offset, tRot), pos.y + lengthdir_y(offset, tRot), bb.depth - 10, obj_tutorial_bullet);
	bul.velocity.x = lengthdir_x(spd, tRot);
	bul.velocity.y = lengthdir_y(spd, tRot);
	bul.damage = earnaro.atk;
	bul.sprite_index = spr_tutorial_bullet2;
}

if (fire[1] > 64)
{
	for (var i = 0; i < 2; i++;)
	{
		var dir = (i * 2 - 1)
		bul = instance_create_depth(pos.x + lengthdir_x(8, rot2 + (i * 2 - 1) * 5), pos.y + lengthdir_y(8, rot2 + (i * 2 - 1) * 5), bb.depth - 10, obj_orbitbullet);
		bul.radius = 8;
		bul.orbitPoint.x = pos.x;
		bul.orbitPoint.y = pos.y;
		bul.orbitSpeed = dir * 2;
		bul.sprite_index = spr_tutorial_bullet3;
		bul.tagID = 3
		bul.maxLife = 800
		bul.life = bul.maxLife
	}
	rot2 += 45;
}

fire[1]++;
rot += deg * 10
if (fire[1] < 300)
{
	alarm[4] = 2;
}
else
{
	with (obj_kanjidecor)
	{
		fadeDelta = -1/room_speed;
	}
	attackCompleted = true;
}
