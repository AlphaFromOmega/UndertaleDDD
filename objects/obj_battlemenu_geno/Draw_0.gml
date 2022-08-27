

draw_reset();

// Draw Background
draw_set_circle_precision(64);
for (var i = 0; i < 16; i++;)
{
	draw_set_alpha(((16-i)/16)/2)
	draw_circle(room_width/2, room_height/2, room_width/10 + (room_width/20 * i/16), false);
}
draw_reset();

repeat(2)
{
	draw_set_color(merge_color(c_blue, c_aqua, random(1)))
	var angle = random(360)
	draw_lightning(room_width/2 + lengthdir_x(room_width/7, angle), room_height/2 + lengthdir_y(room_width/7, angle), room_width/2 + lengthdir_x(room_width/7, angle - 180), room_height/2 + lengthdir_y(room_width/7, angle - 180), 64, 128, 0, room_width/7);
}

repeat(2)
{
	draw_set_color(merge_color(c_aqua, c_white, random_range(0.75, 1)))
	draw_lightning(-32, room_height/2, room_width + 32, room_height/2, 32, 64, 32, 256);
}


// Draw Tutorial Hexagon
var localCorners = corners
for (var i = 0; i < array_length(corners); i++;)
{
	localCorners[i] = new Vector2(corners[i].x + offset + room_width * 3/8, corners[i].y)
}
/*
draw_set_color(c_white)
draw_triangle(localCorners[0].x, localCorners[0].y, localCorners[1].x, localCorners[1].y, localCorners[2].x, localCorners[2].y, false)
draw_rectangle(localCorners[2].x, localCorners[2].y, localCorners[3].x, localCorners[3].y, false)
draw_triangle(localCorners[3].x, localCorners[3].y, localCorners[4].x, localCorners[4].y, localCorners[5].x, localCorners[5].y, false)
*/
if (!surface_exists(outline))
{
	outline = surface_create(room_width, room_height)
}
surface_set_target(outline)
draw_clear_alpha(c_white,0);

var outlineSize = 16
draw_set_color(c_black)
draw_triangle(localCorners[0].x, localCorners[0].y + outlineSize, localCorners[1].x + outlineSize, localCorners[1].y, localCorners[2].x, localCorners[2].y - outlineSize, false)
draw_rectangle(localCorners[2].x, localCorners[2].y - outlineSize, localCorners[3].x, localCorners[3].y + outlineSize, false)
draw_triangle(localCorners[3].x, localCorners[3].y + outlineSize, localCorners[4].x - outlineSize, localCorners[4].y, localCorners[5].x, localCorners[5].y - outlineSize, false)
surface_reset_target()

outline_start_surface(16, c_white, outline, 40)
draw_surface(outline, 0, 0)
outline_end()
// Draw Other Rectangles
for (var i = 1; i < array_length(levels); i++;)
{
	var xPoint = offset + (i * room_width/2) + room_width * 3/8
	draw_sprite_pscaled(sprMonsterBorder, 0, xPoint, room_height/3, room_width/4, room_height/3, 0, c_white, 1);
}

for (var i = 0; i < array_length(levels); i++;)
{
	if (levels[i].sprite == noone)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_title_back);
		draw_set_color(c_gray)
		draw_text_transformed(offset + (i * room_width/2) + room_width/2, room_height/2, "?", 8, 8, 0);
		draw_set_font(fnt_title_fore);
		draw_set_color(c_white);
		draw_text_transformed(offset + (i * room_width/2)  + room_width/2, room_height/2+ 4, "?", 8, 8, 0);
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_title_back);
draw_set_color(c_gray)
draw_text_transformed(room_width/2, 64, string_lower(levels[menuSelected].name), 3, 3, 0);
draw_set_font(fnt_title_fore);
draw_set_color(c_white);
draw_text_transformed(room_width/2, 64, string_lower(levels[menuSelected].name), 3, 3, 0);

draw_set_font(fnt_main);
draw_set_valign(fa_bottom);
draw_text_transformed(room_width/2, room_height - 64,"Fight Selection", 4, 4, 0);