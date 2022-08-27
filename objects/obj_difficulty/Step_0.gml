

cornerPosition.x = x + cornerOffset.x;
cornerPosition.y = y + cornerOffset.y;
cornerPosition2.x = x + cornerOffset2.x;
cornerPosition2.y = y + cornerOffset2.y;

if (x < targetPosition)
{
	x += 16;
}
else
{
	x = targetPosition;
}


if (menuExit)
{
	obj_main_menu.state = STATES.MENU;
	menuAlpha -= 0.05;
	if (menuAlpha <= 0)
	{
		instance_destroy();
	}
}
else
{
	var control = sign(global.controlPressed[CONTROL.AXIS].y);
	if (control != 0)
	{
		menuSelected = revert(menuSelected + control, array_length(menuOptions));
			audio_play_sound_volume(sfx_menu_select, 1, 0.5, VOLUME_TYPE.SFX, false);
	}
	if (global.controlPressed[CONTROL.Z])
	{
		audio_play_sound_volume(sfx_menu_accept, 1, 1, VOLUME_TYPE.SFX, false);
		if (menuSelected == array_length(menuOptions) - 1)
		{
			menuExit = true;
		}
		else
		{
			global.difficulty = menuSelected
		}
	}
	
	if (global.controlPressed[CONTROL.X])
	{
		audio_play_sound_volume(sfx_menu_cancel, 1, 1, VOLUME_TYPE.SFX, false);
		menuExit = true;
	}
}