

if (damage < 0)
{
	type = BULLET_TYPE.GREEN;
	damage = -damage
}

if (oldType != type)
{
	oldType = type;
	switch (type)
	{
		case BULLET_TYPE.WHITE:
			image_blend = c_white;
			break;
		case BULLET_TYPE.GRAY:
			image_blend = c_gray;
			break;
		case BULLET_TYPE.GREEN:
			image_blend = c_green;
			break;
		case BULLET_TYPE.CYAN:
			image_blend = $FFA914
			break;
		case BULLET_TYPE.ORANGE:
			image_blend = c_orange;
			break;
		case BULLET_TYPE.RED:
			image_blend = c_red;
			break;
	}
}
x += velocity.x;
y += velocity.y;