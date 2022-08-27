

if (!instance_exists(obj_level_description) && controllable)
{
	var control = sign(global.controlPressed[CONTROL.AXIS].x);
	if (control != 0)
	{
		menuSelected = revert(menuSelected + control, array_length(levels));
		audio_play_sound_volume(sfx_menu_select, 1, 0.5, VOLUME_TYPE.SFX, false);
	}
	if (global.controlPressed[CONTROL.Z])
	{
		desc = instance_create_depth(-room_width/2, room_height/2, depth - 1, obj_level_description,
		{
			levelID : levels[menuSelected].id,
			levelName : levels[menuSelected].name,
			levelDescription : [levels[menuSelected].description],
			levelQuote : [levels[menuSelected].quote],
			difficulty : levels[menuSelected].difficulty
		});
		audio_play_sound_volume(sfx_menu_accept, 1, 0.5, VOLUME_TYPE.SFX, false);
	}
	if (global.controlPressed[CONTROL.X])
	{
		audio_play_sound_volume(sfx_menu_cancel, 1, 0.5, VOLUME_TYPE.SFX, false);
		instance_create_depth(0, 0, 0, obj_transition, {roomDest : rm_mainmenu});
	}
}
if (offset != menuSelected * room_width/2)
{
	offset = lerp(offset, -menuSelected * room_width/2, 0.05);
	if (abs(offset - -menuSelected * room_width/2) < 1)
	{
		offset = -menuSelected * room_width/2
	}
}
