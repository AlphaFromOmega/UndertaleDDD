/// @description ?
for (var i = 0; i < display_get_gui_width()/sprite_width + 1; i++;)
{
	for (var j = 0; j < display_get_gui_height()/sprite_height + 1; j++;)
	{
		draw_sprite_ext(sprite_index, 0, offsetX + i * sprite_width, offsetY + j * sprite_height, 1, 1, 0, image_blend, image_alpha)
	}
}
