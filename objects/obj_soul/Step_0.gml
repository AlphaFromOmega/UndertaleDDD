

var active = (obj_battle_controller.state == BATTLE_STATE.DIALOG || obj_battle_controller.state == BATTLE_STATE.BATTLE)
if (!active)
{
	velocity.x = 0;
	velocity.y = 0;
	fixed = true;
}
if (instance_exists(obj_battle_controller))
{
	switch(mode)
	{
		case SOUL_MODE.RED: default:
			fixed = false;
			image_yscale = abs(image_yscale);
			image_blend = c_red;
			if (active)
			{
				var nSpd = spd / (global.control[CONTROL.X] + 1)
				velocity.x = global.control[CONTROL.AXIS].x * nSpd;
				velocity.y = global.control[CONTROL.AXIS].y * nSpd;
			}
			break;
		case SOUL_MODE.BLUE:
			fixed = false;
			image_yscale = abs(image_yscale);
			image_blend = c_blue;
			if (active)
			{
				var nSpd = spd / (global.control[CONTROL.X] + 1)
				velocity.x = global.control[CONTROL.AXIS].x * nSpd;
				if (global.control[CONTROL.AXIS].y < 0 && grounded)
				{
					grounded = false;
					velocity.y = -10;
				}
				else if (global.control[CONTROL.AXIS].y >= 0 && velocity.y <= -2)
				{
					velocity.y = -2;
				}
				if (velocity.y > 1 && velocity.y < 16)
				{
					velocity.y += 0.6
				}
				if (velocity.y > -2 && velocity.y <= 1)
				{
					velocity.y += 0.2
				}
				if (velocity.y > -8 && velocity.y <= -2)
				{
					velocity.y += 0.5
				}
				if (velocity.y <= -8)
				{
					velocity.y += 0.2
				}
			}
			break;
		case SOUL_MODE.GREEN:
			fixed = true;
			image_yscale = abs(image_yscale);
			image_blend = c_green;
			velocity.x = 0;
			velocity.y = 0;
			if (active && !instance_exists(shield))
			{
				shield = instance_create_depth(x, y, depth - 1, obj_shield)
			}
			break;
		case SOUL_MODE.MAGENTA:
			image_blend = c_fuchsia;
			image_yscale = abs(image_yscale);
			var nSpd = spd / (global.control[CONTROL.X] + 1)
			velocity.x = global.control[CONTROL.AXIS].x * nSpd;
			velocity.y = 0;
			netPos += global.controlPressed[CONTROL.AXIS].y;
			break;
		case SOUL_MODE.YELLOW:
			image_blend = c_yellow;
			image_yscale = -abs(image_yscale);
			fixed = false;
			if (active)
			{
				var nSpd = spd / (global.control[CONTROL.X] + 1)
				velocity.x = global.control[CONTROL.AXIS].x * nSpd;
				velocity.y = global.control[CONTROL.AXIS].y * nSpd;
				if (global.controlPressed[CONTROL.Z] && obj_battle_controller.state != BATTLE_STATE.DIALOG)
				{
					instance_create_depth(x, y - 8, depth + 1, obj_playerbullet);
					audio_play_sound_volume(sfx_yellowshot, 40, 0.5, VOLUME_TYPE.SFX, false);
				}
			}
			
	}
}
if (inv > 0)
{
	inv--;
	image_speed = 1;
}
else
{
	image_speed = 0;
	image_index = 0;
}