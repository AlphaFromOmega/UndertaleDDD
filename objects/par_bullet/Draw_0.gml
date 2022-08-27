

if (inBoard)
{
	// set up the shader:
	shader_set(sh_bulletboardclip);
	var u_mask = shader_get_sampler_index(sh_bulletboardclip, "u_mask");
	texture_set_stage(u_mask, surface_get_texture(bb.mask));
	var u_rect = shader_get_uniform(sh_bulletboardclip, "u_rect");
	shader_set_uniform_f(u_rect, 0, 0, room_width, room_height);
	// draw things:
	draw_self();
	// finish:
	shader_reset();
}
else
{
	if (sprite_exists(sprite_index))
	{
		draw_self()
	}
}