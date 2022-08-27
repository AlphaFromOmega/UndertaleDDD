/// @description ?
/// @description ?
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_set_halign(fa_center);

var aspectWidth = room_width * 0.75
var addRatio = room_width/8

if (done)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_ext_transformed(room_width/2 + jitter(0.75, 1), lerp(room_height/4, room_height/2, lrp) + jitter(0.75, 1), player_name, 0, 1024, 4 + lrp * 4, 4 + lrp * 4, jitter(1, 2));
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(180, 60, text, 16, room_width, 4, 4, 0);
	
	for (var i = 0; i < 2; i++;)
	{
		draw_set_color(cursor_x == i ? c_yellow : c_white);
		switch (i)
		{
			case 0:
			{
				if (changeable)
				{
					if (allowed)
					{
						draw_text_transformed((aspectWidth * 0.25) + addRatio, room_height * 5/6, "No", 4, 4, 0);
					}
					else
					{
						draw_text_transformed((aspectWidth * 0.25) + addRatio, room_height * 5/6, "Go Back", 4, 4, 0);
					}
				}
				break;
			}
			case 1:
			{
				if (allowed)
				{
					draw_text_transformed((aspectWidth * 0.75) + addRatio, room_height * 5/6, "Yes", 4, 4, 0)
				}
				break;
			}
		}
	}
}
else
{
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_transformed(room_width/2, room_height/8, "Name the fallen human", 4, 4, 0);
	draw_set_valign(fa_center);
	draw_text_transformed(room_width/2, room_height/4, player_name, 4, 4, 0);

	draw_set_valign(fa_top);
	draw_set_halign(fa_center);

	for (var i = 0; i < 7; i++)
	{
		for (var j = 0; j < 8; j++)
		{
			draw_set_color(cursor_x == i && cursor_y == j ? c_yellow : c_white);
			var text_y = 56 * j + ((j > 3) ? 8 : 0);
			draw_text_transformed(aspectWidth/4 + addRatio + jitter(0.2, 4) + i * aspectWidth/12, room_height/3 + jitter(0.2, 1) + text_y, total_case[i][j], 4, 4, 0);
		}
	}
	draw_set_halign(fa_left);
	for (var i = 0; i < 3; i++)
	{
		draw_set_halign(i)
		draw_set_color(cursor_bottom == i && cursor_y == 8 ? c_yellow : c_white);
		draw_text_transformed(bottom_x[i] * aspectWidth + addRatio, room_height * 0.85, bottom_options[i], 4, 4, 0);
	}
}
if (changing_scene)
{
	draw_set_color(c_white);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, room_width, room_height, false);
}
draw_set_alpha(1);