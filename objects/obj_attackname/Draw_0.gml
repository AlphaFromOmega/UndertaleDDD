

draw_reset()
draw_sprite_pscaled(spr_menubox, 0, x, y, room_width/3, 64, image_angle, image_blend, image_alpha)
draw_set_valign(fa_center)
draw_set_halign(fa_left)
draw_set_font(fnt_main)
draw_set_alpha(image_alpha)
draw_text_transformed(x + 16, y + 32, name, 2, 2, image_angle)