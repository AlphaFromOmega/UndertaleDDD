

animDir = new Vector2(lengthdir_x(1, lineRotation), lengthdir_y(1, lineRotation));

offset++;
offset %= lineLength/2
offsetPoint.x = animDir.x * offset;
offsetPoint.y = animDir.y * offset;

var li
li = degtorad(360 - point_direction(animDir.x, animDir.y, 0, 0));
points[0].x = pointsDefault[0].x * cos(li) - pointsDefault[0].y * sin(li)
points[0].y = pointsDefault[0].y * cos(li) + pointsDefault[0].x * sin(li)
points[1].x = pointsDefault[1].x * cos(li) - pointsDefault[1].y * sin(li)
points[1].y = pointsDefault[1].y * cos(li) + pointsDefault[1].x * sin(li)

switch (state)
{
	case STATES.INTRO:
	{
		if (global.controlPressed[CONTROL.Z])
		{
			audio_play_sound_volume(sfx_menu_accept, 1, 1, VOLUME_TYPE.SFX, false);
			menu = true;
		}

		if (menu)
		{
			lineRotation += 2;
			if (lineRotation >= -115)
			{
				menu = false;
				lineRotation = -115;
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
			audio_play_sound_volume(sfx_menu_accept, 1, 1, VOLUME_TYPE.SFX, false);
			switch (menuOptions[menuSelected])
			{
				case "Start":
				{
					instance_create_depth(0, 0, depth - 1, obj_start);
					break;
				}
				case "Difficulty":
				{
					instance_create_depth(0, 0, depth, obj_difficulty);
					break;
				}
				case "Modifiers":
				{
					state = STATES.MENU
					break;
				}
				case "Settings":
				{
					instance_create_depth(0, 0, depth, obj_settings);
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
}

for (var i = 0; i < array_length(line); i++;)
{
	line[i] = new Vector2();
	line[i].x = origin.x + animDir.x * i * lineLength/2;
	line[i].y = origin.y + animDir.y * i * lineLength/2;
}