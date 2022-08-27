

draw_reset();
switch (state)
{
	case BATTLE_STATE.FIGHT:
		draw_sprite_pscaled(spr_target, 0, bb.x, bb.y, bb.boxScale.x - sprite_get_width(bb.sprite_index) * 2/3, bb.boxScale.y - sprite_get_height(bb.sprite_index) * 2/3, bb.boxAngle, c_white, 1);
		break;
}
if (debug_mode)
{
	draw_set_color(c_red);
	draw_text_transformed(0, 0, string(state), 8, 8, 0);
}