

if ((point_direction(earnaro.x + earnaroHandOffset.x, earnaro.y + earnaroHandOffset.y, orbitBullets[0].x, orbitBullets[0].y) + 45) % 90 < orbitingSpeed)
{
	audio_play_sound_volume(sfx_fire_boon, 80, 1, VOLUME_TYPE.SFX, false);
	var eX = earnaro.x
	var eY = earnaro.y + earnaroHandOffset.y
	for (var i = 0; i < MAX_BULLETS; i++;)
	{
		orbitBullets[i].radius = largeRadius/2
		var dir = floor(point_direction(eX, eY, orbitBullets[i].x, orbitBullets[i].y)/90) * 90 + 45
		orbitBullets[i].orbitPoint.x = eX + lengthdir_x(orbitBullets[i].radius, dir)
		orbitBullets[i].orbitPoint.y = eY + lengthdir_y(orbitBullets[i].radius, dir)
		with (orbitBullets[i])
		{
			event_user(0)
		}
	}
	returning = true;
}
else
{
	alarm[2] = 1
}
