

draw_self()
var active = (obj_battle_controller.state == BATTLE_STATE.DIALOG || obj_battle_controller.state == BATTLE_STATE.BATTLE)
if (mode == 2 && active)
{
	draw_set_color(c_green)
	draw_set_circle_precision(12)
	draw_circle(x, y, 60, true)
	draw_circle(x, y, 59, true)
}