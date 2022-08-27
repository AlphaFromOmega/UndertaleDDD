

if (x != room_width/2)
{
	x = min(room_width/2, x + 16);
}
if (!created)
{
	created = true
	descTyper = create_typer(0, 0, depth - 1, levelDescription, descriptionTyper)
	quotTyper = create_typer(0, 0, depth - 1, levelQuote, quoteTyper)
}
else
{
	descTyper.stringPos = string_length(descTyper.originalString)
	descTyper.x = x - size.x/2 + 32
	descTyper.y = y - size.y/2 + 150
	descTyper.textType.writingxend = x + size.x * 0.7/descriptionScale
	
	quotTyper.stringPos = string_length(quotTyper.originalString)
	quotTyper.x = x - size.x/2 + 32
	quotTyper.y = y - size.y/2 + 150 + string_height_ext(string_replace_all(descTyper.originalString, "@", "\n") + "\n\n\n", descriptionTyper.spacing.x/descriptionScale, size.x * 0.7/descriptionScale) * descriptionScale * 2
	quotTyper.textType.writingxend = x + size.x * 0.7/quoteScale
}
if (fade == 0)
{
	selected = revert(selected + sign(global.controlPressed[CONTROL.AXIS].x), 2)
	if (global.controlPressed[CONTROL.Z])
	{
		switch (selected)
		{
			case 0:
			{
				var rm = noone
				try
				{
					rm = asset_get_index("rm_" + string(levelID));
				}
				catch( _exception)
				{
				    show_debug_message(_exception.message);
				    show_debug_message(_exception.longMessage);
				    show_debug_message(_exception.script);
				    show_debug_message(_exception.stacktrace);
				}
				if (rm > -1)
				{
					var ins = instance_create_depth(0, 0, depth, obj_transition_level);
					ins.roomDest = rm;
				}
				else
				{
					show_debug_message("Room Name rm_" + string(levelID) + " Not Found!")
				}
				break;
			}
			case 1:
			{
				fade = -0.05
			}
		}
	}
	if (global.controlPressed[CONTROL.X])
	{
		fade = -0.05
	}
}
else
{
	image_alpha += fade
	descTyper.image_alpha = image_alpha
	quotTyper.image_alpha = image_alpha
	if (image_alpha < 0)
	{
		instance_destroy()
	}
}