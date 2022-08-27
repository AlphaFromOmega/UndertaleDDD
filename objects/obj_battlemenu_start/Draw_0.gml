/// @description ?
draw_reset();
draw_set_alpha(alpha)
var localCorners = corners
for (var i = 0; i < array_length(corners); i++;)
{
	localCorners[i] = new Vector2(corners[i].x + room_width * 3/8, corners[i].y)
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

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_title_back);
draw_set_color(c_gray)
draw_text_transformed(room_width/2, room_height/2, "?", 8, 8, 0);
draw_set_font(fnt_title_fore);
draw_set_color(c_white);
draw_text_transformed(room_width/2, room_height/2 + 4, "?", 8, 8, 0);