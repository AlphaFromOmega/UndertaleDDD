siner += 1
image_alpha -= 0.05

var w = sprite_get_width(sprite_index);
var h = sprite_get_height(sprite_index);
draw_sprite_part_ext(sprite_index, image_index, 0, 0, (w / 2), (h / 2),				(x - sprite_width/2 - siner * image_xscale) + image_xscale,			(y - sprite_height/2 - siner * image_yscale), image_xscale, image_yscale, image_blend, image_alpha)
draw_sprite_part_ext(sprite_index, image_index, (w / 2), 0, (w / 2), (h / 2),		(x - sprite_width/2 + siner * image_xscale) + (w / 2) + image_xscale,	(y - sprite_height/2 - siner * image_yscale), image_xscale, image_yscale, image_blend, image_alpha)
draw_sprite_part_ext(sprite_index, image_index, 0, (h / 2), (w / 2), (h / 2),		(x - sprite_width/2 - siner * image_xscale) + image_xscale,			(y - sprite_height/2 + siner * image_yscale) + (h / 2), image_xscale, image_yscale, image_blend, image_alpha)
draw_sprite_part_ext(sprite_index, image_index, (w / 2), (h / 2), (w / 2), (h / 2), (x - sprite_width/2 + siner * image_xscale) + (w / 2) + image_xscale,	(y - sprite_height/2 + siner * image_yscale) + (h / 2), image_xscale, image_yscale, image_blend, image_alpha)
if (image_alpha < 0.1)
    instance_destroy()