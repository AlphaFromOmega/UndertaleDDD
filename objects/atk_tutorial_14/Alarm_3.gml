

audio_play_sound_volume(sfx_fire_explosion, 80, 0.5, VOLUME_TYPE.SFX, false);
audio_play_sound_volume(sfx_fire_boon, 80, 1, VOLUME_TYPE.SFX, false);
kanjiDir *= -1;
with (par_bullet)
{
	if (tagID == 2)
	{
		var bul = instance_create_depth(x, y, depth, obj_tutorial_bullet);
		var dir = point_direction(other.earnaro.x, other.earnaro.y + other.earnaroHandOffset.y, x, y)
		var time = maxLife - life;
		bul.velocity.x = (x - other.earnaro.x)/time;
		bul.velocity.y = (y - (other.earnaro.y + other.earnaroHandOffset.y))/time;
		bul.damage = damage;
		bul.sprite_index = sprite_index;
		instance_destroy();
	}
}

for (var i = 0; i < 90; i++;)
{
	var bul = instance_create_depth(other.earnaro.x, other.earnaro.y + other.earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	var spd = random_range(2, 16);
	var dir = random(360);
	bul.velocity.x = lengthdir_x(spd, dir);
	bul.velocity.y = lengthdir_y(spd, dir);
	bul.damage = earnaro.atk;
	bul.sprite_index = spr_tutorial_bullet3;
	bul.image_angle = point_direction(0, 0, bul.velocity.x, bul.velocity.y);
}
rot = 0;
alarm[4] = room_speed;