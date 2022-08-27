

earnaro.sprite_index = spr_tutorial_earnaro_fire
audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
var offset = random_range(-11.25, 11.25);

var smallDeg = 360/smallBullets;
var largeDeg = 360/largeBullets;

for (var i = 0; i < smallBullets * 2; i++;)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	bul.velocity.x = lengthdir_x(4 + ((i div smallBullets) * 4), i * smallDeg + offset);
	bul.velocity.y = lengthdir_y(4 + ((i div smallBullets) * 4), i * smallDeg + offset);
	bul.damage = earnaro.atk
	bul.sprite_index = spr_tutorial_bullet2
}

var offset = random_range(-22.5, 22.5);
for (var i = 0; i < largeBullets; i++;)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	bul.image_xscale = 2;
	bul.image_yscale = 2;
	bul.velocity.x = lengthdir_x(6, i * largeDeg + offset);
	bul.velocity.y = lengthdir_y(6, i * largeDeg + offset);
	bul.damage = earnaro.atk
}

shots_fired++;

if (shots_fired < 10 + global.difficulty)
{
	alarm[0] = 90;
}
else
{
	earnaro.sprite_index = spr_tutorial_earnaro_cape
	alarm[1] = 240;
}