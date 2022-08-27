

if (destroy)
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
	menuAlpha += 0.05;
}

if (!instance_exists(obj_transition))
{
	var control = sign(global.controlPressed[CONTROL.AXIS].y);
	if (control != 0)
	{
		audio_play_sound_volume(sfx_menu_select, 1, 0.5, VOLUME_TYPE.SFX, false);
		menuSelected = revert(menuSelected + control, array_length(menuOptions));
		while (!menuAvailable[menuSelected])
		{
			menuSelected = revert(menuSelected + control, array_length(menuOptions));
		}
	}
	if (global.controlPressed[CONTROL.Z])
	{
		if (menuSelected == 0)
		{
			instance_create_depth(0, 0, depth, obj_static)
			menuAvailable[0] = false;
			menuSelected = 1;
			//ins.roomDest = rm_battlemenu_paci;
		}
		else
		{
			instance_create_depth(0, 0, 0, obj_transition, {roomDest : rm_battlemenu_geno});
		}
	}

	if (global.controlPressed[CONTROL.X])
	{
		audio_play_sound_volume(sfx_menu_cancel, 1, 1, VOLUME_TYPE.SFX, false);
		menuAlpha = 1;
		destroy = true;
	}
}