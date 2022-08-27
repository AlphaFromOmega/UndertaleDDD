/// @description ?
offsetX = -random(sprite_width)
offsetY = -random(sprite_height)
if (!audio_is_playing(sfx))
{
	instance_destroy();
}