cornerPosition.x = x + cornerOffset.x;
cornerPosition.y = y + cornerOffset.y;
cornerPosition2.x = x + cornerOffset2.x;
cornerPosition2.y = y + cornerOffset2.y;

draw_reset();
draw_set_alpha(menuAlpha);
draw_sprite_pscaled(spr_menubox, 0, x, y, cornerPosition.x - x, cornerPosition.y - y, 0, c_white, menuAlpha);
draw_sprite_pscaled(spr_menubox, 0, x, y, cornerPosition2.x - x, cornerPosition2.y - y, 0, c_white, menuAlpha);

for (var i = 0; i < array_length(menuOptions); i++;)
{
	draw_set_halign(fa_left);
	draw_set_color(menuSelected[0] == i ? c_yellow : c_white)
	if (i == array_length(menuOptions) - 1)
	{
		draw_set_valign(fa_bottom);
		draw_text_transformed(x + 32, y - 32, menuOptions[i], 4, 4, 0)
	}
	else
	{
		draw_set_valign(fa_top);
		draw_text_transformed(x + 32, cornerPosition.y + 32 + 64 * i, menuOptions[i], 4, 4, 0)
	}
	draw_set_valign(fa_top);
}
draw_set_color(c_white);
draw_set_valign(fa_top);
// Draw current settings
var selected = clamp(menuSelected[0], 0, array_length(menuSettings)-1);
for (var i = 0; i < array_length(menuSettings[selected]); i++;)
{
	var c = c_white
	if (state == SETTINGS_STATE.ALTMENU)
	{
		c = menuSelected[1] == i ? c_yellow : c_white
		draw_set_color(c)
	}
	
	draw_set_halign(fa_left);
	
	if (i == array_length(menuSettings[selected]) - 1)
	{
		draw_set_valign(fa_bottom);
		draw_text_transformed(x + cornerOffset2.x + 32, y - 32, menuSettings[selected][i][0], 2, 2, 0)
	}
	else
	{
		draw_set_valign(fa_top);
		draw_text_transformed(x + cornerOffset2.x + 32, y + cornerOffset.y + 32 + i * 32, menuSettings[selected][i][0], 2, 2, 0);
	}
	draw_set_valign(fa_top);
	
	var iSelected = menuSettings[selected][i];
	if (iSelected[1] != SETTINGS_VALUES.NONE)
	{
		draw_set_halign(fa_right);
		switch (iSelected[1])
		{
			case SETTINGS_VALUES.BOOL:
			{
				draw_sprite_ext(spr_checkbox, iSelected[2], x + cornerOffset.x - 32, y + cornerOffset.y + 32 + i * 32, 2, 2, 0, c, menuAlpha)
				break;
			}
			case SETTINGS_VALUES.SLIDER:
			{
				var minX = x + (cornerOffset.x - cornerOffset2.x)/2 + cornerOffset2.x
				var maxX = x + cornerOffset.x - 32
				
				var topY = y + cornerOffset.y + 32 + i * 32 
				var bottomY = y + cornerOffset.y + 32 + i * 32 + 24
				draw_triangle_color(maxX, topY, maxX, bottomY, minX, bottomY, $AAAAAA, $AAAAAA, $AAAAAA, false)
				
				var position = lerp(minX + 4, maxX - 4, iSelected[2])
				draw_rectangle(position - 4, topY, position + 4, bottomY, false)
				
				break;
			}
		}

	}
}
draw_set_alpha(1);