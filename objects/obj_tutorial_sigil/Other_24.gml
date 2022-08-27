/// @description Disable self
event_inherited();

enabled = false
shootable = false
image_alpha = 0.25
audio_play_sound_volume(sfx_box_destroy, 40, 1, VOLUME_TYPE.SFX, false);