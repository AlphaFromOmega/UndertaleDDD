


earnaro.sprite_index = spr_tutorial_earnaro_fire
audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
var orange = round(random(1));
for (var i = 0; i < MAX_BULLETS; i++;)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	var offset = random_range(-0.5, 0.5);
	bul.velocity.x = lengthdir_x(2, 2 * i + offset);
	bul.velocity.y = lengthdir_y(2, 2 * i + offset);
	if (orange)
	{
		bul.type = BULLET_TYPE.ORANGE
	}
	else
	{
		bul.type = BULLET_TYPE.CYAN
	}
	lowest_bullet[shots_fired][i] = bul
	bul.image_alpha = 0.75;
	bul.damage = earnaro.atk
}

shots_fired++;

if (shots_fired < MAX_SHOTS)
{
	alarm[0] = 30 - (sqrt(global.difficulty) * 10);
}
else
{
	earnaro.sprite_index = spr_tutorial_earnaro_cape
	alarm[1] = 300;
}