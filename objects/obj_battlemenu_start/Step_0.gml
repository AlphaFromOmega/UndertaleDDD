/// @description ?
if (!instance_exists(obj_level_description) && alpha >= 1)
{
	if (global.controlPressed[CONTROL.Z])
	{
		desc = instance_create_depth(-room_width/2, room_height/2, depth - 1, obj_level_description)
		desc.levelID = level.id
		desc.levelName = level.name
		desc.levelDescription[0] = level.description
		desc.levelQuote[0] = level.quote
		desc.difficulty = level.difficulty
		audio_play_sound_volume(sfx_menu_accept, 1, 0.5, VOLUME_TYPE.SFX, false);
	}
	if (global.controlPressed[CONTROL.X])
	{
		alpha = 1;
		alphaDelta *= -1;
		audio_play_sound_volume(sfx_menu_cancel, 1, 0.5, VOLUME_TYPE.SFX, false);
		obj_start_menu.fadeOut = false;
		obj_start_menu.state = STATES.MENU;
		obj_start_menu.menuAlpha = 0;
	}
}
if (alpha <= 0)
{
	instance_destroy()
}
alpha += alphaDelta;