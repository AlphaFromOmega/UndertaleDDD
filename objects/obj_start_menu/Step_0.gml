/// @description ?
pulse += pulseChange
if (pulse <= 0 || 1 <= pulse)
{
	pulse = clamp(pulse, 0, 1);
	pulseChange *= -1;
}
switch (state)
{
	case STATES.INTRO:
	{
		if (global.controlPressed[CONTROL.Z])
		{
			audio_play_sound_volume(sfx_menu_accept, 1, 0.5, VOLUME_TYPE.SFX, false);
			menu = true;
		}

		if (menu)
		{
			introAlpha -= 0.025;
			if (introAlpha <= 0)
			{
				menu = false;
				state = STATES.MENU;
			}
		}
		break;
	}
	case STATES.MENU:
	{
		menuAlpha += 0.05;
		var control = sign(global.controlPressed[CONTROL.AXIS].y);
		if (control != 0)
		{
			audio_play_sound_volume(sfx_menu_select, 1, 0.5, VOLUME_TYPE.SFX, false);
			menuSelected = revert(menuSelected + control, array_length(menuOptions));
		}
		if (global.controlPressed[CONTROL.Z])
		{
			state = STATES.ALT_MENU
			audio_play_sound_volume(sfx_menu_accept, 1, 0.5, VOLUME_TYPE.SFX, false);
			switch (menuOptions[menuSelected])
			{
				case "Start":
				{
					fadeOut = true;
					instance_create_depth(0, 0, depth - 100, obj_battlemenu_start);
					menuAlpha = 1;
					break;
				}
				case "Settings":
				{
					instance_create_depth(0, 0, depth - 100, obj_settings);
					break;
				}
				case "Exit":
				{
					game_end();
					break;
				}
			}
		}
		break;
	}
	case STATES.ALT_MENU:
	{
		if (fadeOut)
		{
			menuAlpha -= 0.05;
		}
		break;
	}
}