

draw_reset();
draw_set_alpha(image_alpha)
draw_sprite_pscaled(spr_menubox, 0, x - size.x/2, y - size.y/2, size.x, size.y, 0, c_white, image_alpha);

draw_line_width(x - size.x/2, y - size.y/2 + 128, x + size.x/2 - 1, y - size.y/2 + 128, 8);
draw_line_width(x + size.x/4 - 32, y + size.y/2 - 1, x + size.x/4 + 32, y - size.y/2 + 128 , 8);

var rr = new Vector2(x + size.x/4 + 56, y - size.y/2 + 160)
var imageBoxSize = new Vector2(256, 464)
var rr2 = new Vector2(rr.x + imageBoxSize.x, rr.y + imageBoxSize.y)
draw_roundrect_ext(rr.x, rr.y, rr2.x, rr2.y, 64, 64, false)
draw_set_color(c_black)
draw_roundrect_ext(rr.x + 4, rr.y + 4, rr2.x - 4, rr2.y - 4, 62, 62, false)

draw_reset();
draw_set_alpha(image_alpha)
if (levelImage == noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_title_back);
	draw_set_color(c_gray)
	draw_text_transformed(rr.x + imageBoxSize.x/2 + 8, rr.y + imageBoxSize.y/2, "?", 8, 8, 0);
	draw_set_font(fnt_title_fore);
	draw_set_color(c_white);
	draw_text_transformed(rr.x + imageBoxSize.x/2 + 8, rr.y + imageBoxSize.y/2 + 4, "?", 8, 8, 0);
}


draw_reset();
draw_set_alpha(image_alpha)
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(fnt_title_back);
draw_set_color(c_gray)
draw_text_transformed(x - size.x/2 + 32, y - size.y/2 + 72, string_lower(levelName), 3, 3, 0);
draw_set_font(fnt_title_fore);
draw_set_color(c_white);
draw_text_transformed(x - size.x/2 + 32, y - size.y/2 + 72, string_lower(levelName), 3, 3, 0);

draw_set_halign(fa_right);
draw_set_font(fnt_main);
var stats = ["ATK: " + string(attack), "DEF: " + string(defense), "HP: " + string(hp), "Slain: N/A", "Difficulty"]

for (var i = 0; i < array_length(stats); i++;)
{
	draw_text_transformed(x + size.x/2 - 32, y + 160 + 48 * i, stats[i], 3, 3, 0);
}


for (var i = 0; i < difficulty; i++;)
{
	draw_sprite_ext(spr_star, 0, x + size.x/2 - (64 + 48 * i),  y + 172 + 48 * array_length(stats), 0.25, 0.25, 0, c_white, image_alpha)
}

var wins = global.gameStats[? levelID].difficultyWin
var a = 0
for (var i = 0; i < array_length(wins); i++;)
{
	if (wins[i] > 0)
	{
		draw_sprite_ext(spr_medal, i * 2 + wins[i] - 1, rr.x + 16 + (imageBoxSize.x - 32) * a/array_length(wins), rr2.y - 8, 3, 3, 0, c_white, image_alpha);
		a++;
	}
}

draw_set_halign(fa_center);
for (var i = 0; i < array_length(menuOptions); i++;)
{
	draw_set_color(selected == i ? c_yellow : c_white)
	draw_text_transformed(x + size.x * 0.35 + i * 128, y + size.y/2 - 40, menuOptions[i], 3, 3, 0)
}