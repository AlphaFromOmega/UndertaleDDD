


for (var i = 0; i < shots_fired; i++;)
{
	if (!hitBox[i] && collision_point(lowest_bullet[i][135].x, lowest_bullet[i][135].y, obj_bbcollider, false, true))
	{
		for (var j = 0; j < MAX_BULLETS; j++;)
		{
			if (instance_exists(lowest_bullet[i][j]))
			{
				lowest_bullet[i][j].velocity.x *= 1.5 + global.difficulty/2;
				lowest_bullet[i][j].velocity.y *= 1.5 + global.difficulty/2;
			}
		}
		audio_play_sound_volume(sfx_bell_0, 100, 0.5, VOLUME_TYPE.SFX, false);
		hitBox[i] = true;
	}
}