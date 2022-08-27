

draw_reset();
var alpha = (offset/(lineLength/2 - 1)) * 0.1
for (var i = 0; i < array_length(line); i++;)
{
	draw_set_alpha(alpha)
	draw_line_width_color(line[i].x + offsetPoint.x + points[0].x, line[i].y + offsetPoint.y + points[0].y, line[i].x + offsetPoint.x + points[1].x, line[i].y + offsetPoint.y + points[1].y, 4, c_aqua, c_aqua);
	alpha += 0.1;
}
draw_set_alpha(1)

switch (state)
{
	case STATES.INTRO:
	{
		if (!menu)
		{
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
		
			draw_set_color(c_grey);
			draw_set_font(fnt_title_back);
			draw_text_transformed(room_width/2, 160, "undertAle", 8, 8, 0);
			draw_text_transformed(room_width/2, room_height/2 + 32, "press \'z\' to start", 2, 2, 0);
		
			draw_set_color(c_white);
			draw_set_font(fnt_title_fore);
			draw_text_transformed(room_width/2, 160, "undertAle", 8, 8, 0);
			draw_text_transformed(room_width/2, room_height/2 + 32, "press \'z\' to start", 2, 2, 0);
		
			draw_set_font(fnt_main);
			draw_text_transformed(room_width/2, room_height/2 - 192, "Distorted Distinctive Destiny", 4, 4, 0);
		}
		break;
	}
	case STATES.MENU: case STATES.ALT_MENU:
	{
		draw_set_alpha(menuAlpha)
		
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		
		draw_set_color(c_grey);
		draw_set_font(fnt_title_back);
		draw_text_transformed(64, 32, "undertAle", 3, 3, 0);
		
		draw_set_color(c_white);
		draw_set_font(fnt_title_fore);
		draw_text_transformed(64, 32, "undertAle", 3, 3, 0);
		
		var oX = string_width("undertAle") * 1.5
		var oY = string_height("undertAle") * 3
		
		draw_set_halign(fa_center);
		draw_set_font(fnt_main);
		draw_text_transformed(64 + oX, 32 + oY, "Distorted Distinctive Destiny", 2, 2, 0);
		
		
		draw_set_font(fnt_main);
		draw_set_halign(fa_right);
		for (var i = 0; i < array_length(menuOptions); i++;)
		{
			var pos = (96 * i) + 96;
			draw_set_color(menuSelected == i ? c_yellow : c_white)
			draw_text_transformed(origin.x + animDir.x * pos, origin.y + animDir.y * pos, menuOptions[i] + "   ", 4, 4, 0);
		}
		break;
	}
}