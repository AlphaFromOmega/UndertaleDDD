

with (par_bullet)
{
	switch (tagID)
	{
		case 1:
		{
			if (velocity.length() >= 2)
			{
				velocity.x *= 0.99
				velocity.y *= 0.99
			
			}
			var channel = animcurve_get_channel(animcurve_get(ac_easeinandout), "d")
			if (curvePostion < 1)
			{
				var spd = 0.25 * moveDir
				var changeBy = degtorad(((-2 * animcurve_channel_evaluate(channel, curvePostion)) + 1) * spd)
				var distance = new Vector2(x - other.earnaro.x, y - (other.earnaro.y + other.earnaroHandOffset.y))
			
				x = (distance.x * cos(changeBy) - distance.y * sin(changeBy)) + other.earnaro.x
				y = (distance.x * sin(changeBy) + distance.y * cos(changeBy)) + (other.earnaro.y + other.earnaroHandOffset.y)
				image_blend = merge_color(colour, c_white, curvePostion);
				curvePostion += 0.005
			}
			else
			{
				type = BULLET_TYPE.WHITE;
			}
			break;
		}
		case 3:
		{
			image_angle = point_direction(orbitPoint.x, orbitPoint.y, x, y);
			radius += 2 + ((maxLife - life)/maxLife) * 4;
		}
		default:
			break;
	}
}

with (obj_kanjidecor)
{
	radius = clamp(radius + other.kanjiDir, 0.01, 256);
}
if (attackCompleted && !instance_exists(obj_kanjidecor))
{
	event_user(15);
}