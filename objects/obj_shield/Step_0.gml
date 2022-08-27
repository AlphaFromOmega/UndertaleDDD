

x = obj_soul.x;
y = obj_soul.y;

var nSpd = spd / (global.control[CONTROL.X] + 1)
rot = revert(rot - global.control[CONTROL.AXIS].x * nSpd, 360)

direction = rot;
image_angle = rot;

if (obj_battle_controller.state != BATTLE_STATE.BATTLE && obj_battle_controller.state != BATTLE_STATE.DIALOG)
{
	instance_destroy()
}