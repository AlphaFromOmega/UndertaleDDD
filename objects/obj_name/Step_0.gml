/// @description ?
if (changing_scene)
{
	alpha += 0.003;
	if (lrp < 1)
	{
		lrp += 0.005;
	}
	if (alpha > 1.1)
	{
		global.name = player_name;
		obj_global.destRoom = rm_mainmenu
		save_game();
		room_goto(rm_mainmenu);
		
	}
}
else
{
	var xmov = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
	var ymov = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

	if (done)
	{
		if (lrp < 1)
		{
			lrp += 0.005;
		}
	
		cursor_x += xmov + ymov;	
		if (cursor_x > allowed)
		{
			cursor_x = !changeable;
		}
		if (cursor_x < !changeable)
		{
			cursor_x = allowed;
		}
		if (keyboard_check_pressed(ord("Z")))
		{
			switch (cursor_x)
			{
				case 0:
				{
					done = false;
					cursor_x = 0;
					cursor_y = 0;
					break;
				}
				case 1:
				{
					// goto flowey room
					changing_scene = true;
					change_music(noone);
					break;
				}
			}
		}
	}
	else
	{
		cursor_x += xmov;
		cursor_y += ymov;

		var hoz_max = (cursor_y == 8) ? 3 : array_length(total_case);

		while (cursor_x > 0 && cursor_y > 0 && cursor_x < 7 && cursor_y < 8 && total_case[cursor_x][cursor_y] == "")
		{
			cursor_x += xmov;
			cursor_y += ymov;
		}

		if (cursor_x < 0)
		{
			cursor_x = hoz_max - 1;
		}
		if (cursor_y < 0)
		{
			cursor_y = 8;
		}
		if (cursor_x >= hoz_max)
		{
			cursor_x = 0;
		}
		if (cursor_y > 8)
		{
			cursor_y = 0;
		}


		while (cursor_x > 0 && cursor_y > 0 && cursor_x < 7 && cursor_y < 8 && total_case[cursor_x][cursor_y] == "")
		{
			cursor_x += xmov;
			cursor_y += ymov;
		}

		if (cursor_y == 8)
		{
			switch(cursor_bottom)
			{
				case 0:
				{
					cursor_x = 0;
					break;
				}
				case 1:
				{
					cursor_x = 2;
					break;
				}
				case 2:
				{
					cursor_x = 5;
					break;
				}
			}
			cursor_bottom += xmov
			if (cursor_bottom < 0)
			{
				cursor_bottom = 2;
			}
			if (cursor_bottom > 2)
			{
				cursor_bottom = 0;
			}
		}
		else
		{
			switch(cursor_x)
			{
				case 0: case 1:
				{
					cursor_bottom = 0;
					break;
				}
				case 2: case 3: case 4:
				{
					cursor_bottom = 1;
					break;
				}
				case 5: case 6:
				{
					cursor_bottom = 2;
					break;
				}
			}
		}

		if (keyboard_check_pressed(ord("Z")))
		{
			if (cursor_y < 8)
			{
				if (string_length(player_name) < 6)
				{
					player_name += total_case[cursor_x][cursor_y];
				}
			}
			else
			{
				switch (cursor_bottom)
				{
					case 0:
					{
						player_name = ""
						break;
					}
					case 1:
					{
						player_name = string_delete(player_name, string_length(player_name), 1);
						break;
					}
					case 2:
					{
						changeable = true;
						done = true;
						lrp = 0;
						cursor_x = 0;
						switch (string_lower(player_name))
						{
							#region Forbidden Names
							case "":
							{
								text = "You must choose a name.";
								allowed = false;
								break;
							}
							case "alphys":
							{
								text = "D-don't do that";
								allowed = false;
								break;
							}
							case "asgore":
							{
								text = "You cannot";
								allowed = false;
								break;
							}
							case "asriel":
							{
								text = "...";
								allowed = false;
								break;
							}
							case "flowey":
							{
								text = "I already chose that name.";
								allowed = false;
								break;
							}
							case "sans":
							{
								text = "nope.";
								allowed = false;
								break;
							}
							case "toriel":
							{
								text = "I think you should think of your own name, my child.";
								allowed = false;
								break;
							}
							case "undyne":
							{
								text = "Get your own name";
								allowed = false;
								break;
							}
							case "bepis":
							{
								text = "You can't say that!";
								allowed = false;
								break;
							}
							#endregion
							#region Allowed Names
							case "frisk":
							{
								text = "WARNING:This name will do absolutely nothing!\nProceed anyway?\n\n\n\n\n\n\n\n\n\n(You can change difficulity on the main menu.)";
								allowed = true;
								break;
							}
							case "chara":
							{
								text = "The true name.";
								allowed = true;
								break;
							}
							case "aaaaaa":
							{
								text = "Still not very creative...?";
								allowed = true;
								break;
							}
							case "zzzzzz":
							{
								text = "Incredibly creative!";
								allowed = true;
								break;
							}
							case "aaron":
							{
								text = "Is this name correct? ;)";
								allowed = true;
								break;
							}
							case "zarla": case "zarlas":
							{
								text = "Gotta hand it to you.";
								allowed = true;
								break;
							}
							case "dork": case "dorked":
							{
								text = "I'm sensing a shift in fate.";
								allowed = true;
								break;
							}
							case "king": case "tk":
							{
								text = "SHIT! PACK IT UP WE'VE BEEN RATTED OUT!";
								allowed = true;
								break;
							}
							case "toby": case "fox":
							{
								text = "Damn its the guy who made that game.";
								allowed = true;
								break;
							}
							case "german": case "germy":
							{
								text = "Overtime.";
								allowed = true;
								break;
							}
							case "spud":
							{
								text = "I further fell down the stairs.";
								allowed = true;
								break;
							}
							default:
							{
								text = "Is this name correct?";
								allowed = true;
								break;
							}
							#endregion
						}
						break;
					}
				}
			}
		}
	}
}