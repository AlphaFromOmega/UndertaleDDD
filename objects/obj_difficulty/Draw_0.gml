

draw_reset();
draw_set_alpha(menuAlpha);
draw_sprite_pscaled(spr_menubox, 0, x, y, cornerPosition.x - x, cornerPosition.y - y, 0, c_white, menuAlpha);
draw_sprite_pscaled(spr_menubox, 0, x, y, cornerPosition2.x - x, cornerPosition2.y - y, 0, c_white, menuAlpha);

for (var i = 0; i < array_length(menuOptions); i++;)
{
	draw_set_halign(fa_left);
	draw_set_color(menuSelected == i ? c_yellow : c_white)
	if (i == global.difficulty)
	{
		draw_sprite(sprDifficultySelect, 0 ,x + 40, cornerPosition.y + 60 + 64 * i)
	}
	if (i == array_length(menuOptions) - 1)
	{
		draw_set_valign(fa_bottom);
		draw_text_transformed(x + 32, y - 32, menuOptions[i], 4, 4, 0)
	}
	else
	{
		draw_set_valign(fa_top);
		draw_text_transformed(x + 64, cornerPosition.y + 32 + 64 * i, menuOptions[i], 4, 4, 0)
	}
	draw_set_valign(fa_top);
}
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_text_ext_transformed(x + cornerOffset2.x + 32, y + cornerOffset.y + 32, menuDescription[clamp(menuSelected, 0, 4)], 14, ((cornerOffset.x - cornerOffset2.x) - 64)/2, 2, 2, 0);
draw_set_alpha(1);