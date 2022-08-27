if (x < targetPosition)
{
	x += 16;
}
else
{
	x = targetPosition;
}

var control = sign(global.controlPressed[CONTROL.AXIS].y);
switch(state)
{
	case SETTINGS_STATE.MENU:
	{
		if (control != 0)
		{
			audio_play_sound_volume(sfx_menu_select, 1, 0.5, VOLUME_TYPE.SFX, false);
			menuSelected[0] = revert(menuSelected[0] + control, array_length(menuOptions));
		}
		if (global.controlPressed[CONTROL.Z])
		{
			audio_play_sound_volume(sfx_menu_accept, 1, 1, VOLUME_TYPE.SFX, false);
			menuSelected[1] = 0;
			if (menuSelected[0] == array_length(menuOptions) - 1)
			{
				state = SETTINGS_STATE.EXIT;
			}
			else
			{
				state = SETTINGS_STATE.ALTMENU;
			}
		}
		if (global.controlPressed[CONTROL.X])
		{
			audio_play_sound_volume(sfx_menu_cancel, 1, 1, VOLUME_TYPE.SFX, false);
			state = SETTINGS_STATE.EXIT;
		}
		break;
	}
	case SETTINGS_STATE.ALTMENU:
	{
		if (control != 0)
		{
			audio_play_sound_volume(sfx_menu_select, 1, 0.5, VOLUME_TYPE.SFX, false);
			menuSelected[1] = revert(menuSelected[1] + control, array_length(menuSettings[menuSelected[0]]));
		}
		if (global.controlPressed[CONTROL.Z])
		{
			audio_play_sound_volume(sfx_menu_accept, 1, 1, VOLUME_TYPE.SFX, false);
			var a0 = menuSelected[0];
			var a1 = menuSelected[1];
			if (a1 == array_length(menuSettings[a0]) - 1)
			{
				state = SETTINGS_STATE.MENU;
			}
			else
			{
				switch (a0)
				{
					case 0:
					{
						switch (a1)
						{
							case 0:
							{
								break;
							}						
						}
						break;
					}
					case 1:
					{
						switch (a1)
						{
							case 0:
							{
								window_set_fullscreen(!menuSettings[a0][a1][2]);
								menuSettings[a0][a1][2] = window_get_fullscreen();
								break;
							}						
						}
						break;	
					}
					case 2:
					{
						break;
					}
				}
			}
		}
		if (global.controlPressed[CONTROL.X])
		{
			audio_play_sound_volume(sfx_menu_cancel, 1, 1, VOLUME_TYPE.SFX, false);
			state = SETTINGS_STATE.MENU;
		}
		
		if (global.control[CONTROL.AXIS].x != 0)
		{
			var a0 = menuSelected[0];
			var a1 = menuSelected[1];
			switch (a0)
			{
				case 0:
				{
					if (a1 < 4)
					{
						global.volumeSlider[a1] = clamp(global.volumeSlider[a1] + sign(global.control[CONTROL.AXIS].x)/100, 0, 1)
						menuSettings[a0][a1][2] = global.volumeSlider[a1];
						if (a1 == 0)
						{
							for (var i = 1; i < 4; i++)
							{
								global.volume[i] = global.volumeSlider[0] * global.volumeSlider[i]
								audio_group_set_gain(global.vGroup[i], global.volume[i], 0)
							}
						}
						else
						{
							global.volume[a1] = global.volumeSlider[0] * global.volumeSlider[a1]
							audio_group_set_gain(global.vGroup[a1], global.volume[a1], 0)
						}
					}
					break;
				}
				default:
					break
			}
		}
		break;
	}
	case SETTINGS_STATE.EXIT:
	{
		event_user(0)
		obj_main_menu.state = STATES.MENU;
		menuAlpha -= 0.05;
		if (menuAlpha <= 0)
		{
			instance_destroy();
		}
		break;
	}
}