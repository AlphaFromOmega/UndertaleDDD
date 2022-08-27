// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_music(_music)
{
	if (audio_exists(_music))
	{
		if (global.music != _music)
		{
			if (audio_exists(global.music))
			{
				audio_sound_gain(global.music, 0, 100);
				global.music = audio_play_sound_volume(_music, 0, 1, VOLUME_TYPE.MUSIC, true);
			}
			else
			{
				global.music = audio_play_sound_volume(_music, 0, 1, VOLUME_TYPE.MUSIC, true);
			}
		}
	}
	else
	{
		audio_stop_sound(global.music);
		global.music = noone;
	}
}

enum VOLUME_TYPE
{
	MUSIC = 1,
	SFX = 2,
	VOICE = 3
}

function audio_play_sound_volume(_sound, _priority, _volume, _volume_type, _loops)
{
	var s = audio_play_sound(_sound, _priority, _loops);
	audio_sound_gain(s, _volume * global.volume[_volume_type], 0);
	return s;
}

