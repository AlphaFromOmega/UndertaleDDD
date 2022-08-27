

if (enabled)
{
	if (fire <= 0)
	{
		if (audio_is_playing(lastFire))
		{
			audio_stop_sound(lastFire)
		}
		lastFire = audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false)
		var bul = instance_create_depth(x, y, depth - 1, bullet)
		bul.velocity.x = lengthdir_x(6, dir + shootDir - shootWave/2)
		bul.velocity.y = lengthdir_y(6, dir + shootDir - shootWave/2)
		bul.damage = damage
		bul.sprite_index = spr_tutorial_bullet2
		fire = fireDelay
		
		dir += turnSpeed

		if (shootWave > 0 && (dir > shootWave || 0 > dir))
		{
			turnSpeed *= -1
		}
	}
	else
	{
		fire--;
	}
}