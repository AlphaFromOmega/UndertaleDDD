

draw_reset();
draw_sprite_pscaled(spr_menubox, 0, x - room_width/4, y - room_height/10, room_width/2, room_height/5, 0, c_white, menuAlpha);

draw_set_alpha(menuAlpha)
draw_set_halign(fa_center);
draw_text_transformed(room_width/2, y - room_height/10 + 16, "Select a route", 4, 4, 0)

for (var i = 0; i < array_length(menuOptions); i++;)
{
	draw_set_color(menuAvailable[i] ? (menuSelected == i ? c_yellow : c_white) : c_gray)
	draw_set_valign(fa_top);
	draw_text_transformed(x + 0, y - 24 + 48 * i, menuAvailable[i] ? menuOptions[i] : menuOptionsGreyed[i] , 4, 4, 0)
}
draw_set_color(c_white);