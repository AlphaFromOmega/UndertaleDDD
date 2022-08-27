

earnaro.sprite_index = spr_tutorial_earnaro_tpose
audio_play_sound_volume(sfx_fire_explosion, 40, 1, VOLUME_TYPE.SFX, false)
for (var i = 0; i < 6; i++;)
{
	var pos = i > 2 ? i - 2 : i - 3
	sigils[i] = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_sigil)
	sigils[i].x = earnaro.x + pos * 160 + sign(pos) * 128
	sigils[i].y = earnaro.y - earnaro.sprite_height/2 - (abs(pos % 2) - 1) * 96
	sigils[i].image_index = image[i]
	
	var t = sign(pos)
	if (abs(pos) == 1)
	{
		t *= -1
		sigils[i].shootDir = -90;
		sigils[i].shootWave = -1;
		sigils[i].fireDelay = 4;
	}
	else
	{
		sigils[i].shootDir = 90 + 180 * abs(pos % 2);
		sigils[i].shootWave = 200;
		sigils[i].dir = t > 0 ? 0 : sigils[i].shootWave;
	}
	if (abs(pos) == 2)
	{
		sigils[i].bullet = obj_tutorial_fallbullet
	}
	else
	{
		sigils[i].bullet = obj_tutorial_bullet
	}
	sigils[i].turnSpeed = 8 * t
	sigils[i].enabled = true
	sigils[i].damage = earnaro.atk
}
spawned = true