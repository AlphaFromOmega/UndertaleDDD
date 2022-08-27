/// @description ?
draw_reset();
draw_set_alpha(menuAlpha)
draw_set_circle_precision(64);
for (var i = 0; i < 16; i++;)
{
	draw_set_alpha(((16-i)/16)/2);
	var e = animcurve_channel_evaluate(ac, audio_sound_get_track_position(global.music)/musLength);
	draw_circle(room_width/2, room_height/2, ((room_width/10 * e) + (room_width/20 * i/16)) * e, false);
}
draw_reset();
switch (state)
{
	case STATES.INTRO:
	{
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_set_alpha(introAlpha)
		draw_set_color(c_grey);
		draw_set_font(fnt_title_back);
		draw_text_transformed(room_width/2, room_height * 0.85, "press \'z\' to start", 2, 2, 0);
		draw_set_color(c_white);
		draw_set_font(fnt_title_fore);
		draw_text_transformed(room_width/2, room_height * 0.85, "press \'z\' to start", 2, 2, 0);
		break;
	}
	case STATES.MENU: case STATES.ALT_MENU:
	{
		draw_set_font(fnt_main);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_right);
		draw_set_alpha(menuAlpha)
		for (var i = 0; i < array_length(menuOptions); i++;)
		{
			draw_set_color(menuSelected == i ? c_yellow : c_white)
			draw_text_transformed(room_width - 32, (room_height - (array_length(menuOptions) - (i + 1)) * 64) - 32, menuOptions[i], 4, 4, 0);
		}
		break;
	}
}
