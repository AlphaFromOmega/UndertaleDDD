

if (instance_exists(orbitBullets[0]))
{
	var dis = point_distance(earnaro.x, earnaro.y + earnaroHandOffset.y, orbitBullets[0].x, orbitBullets[0].y)
	if (canOrbitCenter)
	{
		if (dis + 1 >= largeRadius)
		{
			for (var i = 0; i < MAX_BULLETS; i++;)
			{
				orbitBullets[i].orbitPoint.x = earnaro.x
				orbitBullets[i].orbitPoint.y = earnaro.y + earnaroHandOffset.y
				orbitBullets[i].radius = largeRadius
			}
			alarm[2] = 830/orbitingSpeed
			canOrbitCenter = false
		}
	}
	else if (dis < 16)
	{
		returning = false;
		canOrbitCenter = true
		centerReturn++;
		if (centerReturn >= 2)
		{
			instance_destroy(obj_orbitspawnbullet)
		}
		else
		{
			audio_play_sound_volume(sfx_fire_laser, 80, 1, VOLUME_TYPE.SFX, false);
		}
	}
	if (returning && centerReturn >= 1 && dis < 64)
	{
		earnaro.sprite_index = spr_tutorial_earnaro_fire
	}
}

if (centerReturn >= 2 && !instance_exists(par_bullet))
{
	event_user(15)
}

