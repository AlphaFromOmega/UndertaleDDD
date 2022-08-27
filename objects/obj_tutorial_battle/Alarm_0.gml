

audio_play_sound_volume(sfx_heavydamage, 40, volume, VOLUME_TYPE.SFX, false);
volume *= 0.75;
if (volume > 0.05)
{
	alarm[0] = 10;
}
else
{
	alarm[1] = room_speed;
}