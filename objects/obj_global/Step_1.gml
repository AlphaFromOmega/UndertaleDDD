


#region Controls
	var tempControl
	tempControl[CONTROL.Z] = keyboard_check(ord("Z")) || keyboard_check(vk_enter);
	tempControl[CONTROL.X] = keyboard_check(ord("X")) || keyboard_check(vk_shift);
	tempControl[CONTROL.C] = keyboard_check(ord("C")) || keyboard_check(vk_control);
	if (gamepad_is_connected(0))
	{
		tempControl[CONTROL.Z] = tempControl[CONTROL.Z] || gamepad_button_check(0, gp_face1)
		tempControl[CONTROL.X] = tempControl[CONTROL.X] || gamepad_button_check(0, gp_face2)
		tempControl[CONTROL.C] = tempControl[CONTROL.C] || gamepad_button_check(0, gp_face3)
	}
	for (var i = 0; i < array_length(tempControl); i++;)
	{
		global.controlPressed[i] = false;
		if (tempControl[i] != global.control[i])
		{
			global.controlPressed[i] = tempControl[i];
		}
		global.control[i] = tempControl[i];
	}

	var tempAxis = new Vector2(keyboard_check(vk_right) - keyboard_check(vk_left), keyboard_check(vk_down) - keyboard_check(vk_up))
	global.controlPressed[CONTROL.AXIS] = new Vector2();
	if (tempAxis.x != global.control[CONTROL.AXIS].x)
	{
		global.controlPressed[CONTROL.AXIS].x = tempAxis.x;
	}
	if (tempAxis.y != global.control[CONTROL.AXIS].y)
	{
		global.controlPressed[CONTROL.AXIS].y = tempAxis.y;
	}
	global.control[i] = tempAxis;

	if (gamepad_is_connected(0))
	{
		gamepad_set_axis_deadzone(0, 0.2)
		var tempAxis = new Vector2(gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv))
		if (tempAxis.x != 0 || tempAxis.y != 0)
		{
			if (sign(tempAxis.x) != sign(lastGamepad.x))
			{
				global.controlPressed[CONTROL.AXIS].x = sign(tempAxis.x);
			}
			if (sign(tempAxis.y) != sign(lastGamepad.y))
			{
				global.controlPressed[CONTROL.AXIS].y = sign(tempAxis.y);
			}
			global.control[CONTROL.AXIS] = tempAxis;
		}
	
		lastGamepad = tempAxis
		var tempAxis = new Vector2(gamepad_button_check(0, gp_padr) - gamepad_button_check(0, gp_padl), gamepad_button_check(0, gp_padd) - gamepad_button_check(0, gp_padu))
		if (tempAxis.x != 0 || tempAxis.y != 0)
		{
			if (tempAxis.x != lastDpad.x)
			{
				global.controlPressed[CONTROL.AXIS].x = tempAxis.x;
			}
			if (tempAxis.y != lastDpad.y)
			{
				global.controlPressed[CONTROL.AXIS].y = tempAxis.y;
			}
			global.control[i] = tempAxis;
		}
		lastDpad = tempAxis
	}
#endregion

if (debug_mode)
{
	if (keyboard_check_pressed(ord("T")))
	{
		room_goto(rm_name)
	}
}