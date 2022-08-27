/// @description Save Settings
ini_open("settings.ini")
ini_write_real("Audio", "VoiceVolume", global.volumeSlider[3]);
ini_write_real("Audio", "MusicVolume", global.volumeSlider[1]);
ini_write_real("Audio", "SFXVolume", global.volumeSlider[2]);
ini_write_real("Audio", "MasterVolume", global.volumeSlider[0]);

ini_write_real("Video", "Fullscreen", window_get_fullscreen());
ini_close()