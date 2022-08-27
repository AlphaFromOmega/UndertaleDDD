

audio_group_load(ag_sfx)
audio_group_load(ag_music)
audio_group_load(ag_voice)
if (debug_mode)
{
	random_set_seed(1);
}
else
{
	randomise();
}

ini_open("settings.ini")
global.volumeSlider[0] = ini_read_real("Audio", "MasterVolume", 1);
global.volumeSlider[1] = ini_read_real("Audio", "MusicVolume", 1);
global.volumeSlider[2] = ini_read_real("Audio", "SFXVolume", 1);
global.volumeSlider[3] = ini_read_real("Audio", "VoiceVolume", 1);

window_set_fullscreen((ini_read_real("Video", "Fullscreen", 0) == 1))

ini_write_real("Audio", "VoiceVolume", global.volumeSlider[3]);
ini_write_real("Audio", "MusicVolume", global.volumeSlider[1]);
ini_write_real("Audio", "SFXVolume", global.volumeSlider[2]);
ini_write_real("Audio", "MasterVolume", global.volumeSlider[0]);

ini_write_real("Video", "Fullscreen", window_get_fullscreen());
ini_close()