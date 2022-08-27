if (!(unavoidable && false) && other.inv <= 0 && canCollide)
{
	switch (type)
	{
		case BULLET_TYPE.WHITE:
			attack_soul(damage, other, unavoidable);
			break;
		case BULLET_TYPE.GREEN:
			attack_soul(-damage, other, unavoidable);
			break;
		case BULLET_TYPE.CYAN:
			if !(other.previous.x == other.x && other.previous.y == other.y)
			{
				attack_soul(damage, other, unavoidable);
			}
			break;
		case BULLET_TYPE.ORANGE:
			if (other.previous.x == other.x && other.previous.y == other.y)
			{
				if (allowGrace && grace)
				{
					grace = false
				}
				else
				{
					attack_soul(damage, other, unavoidable);
				}
			}
			else
			{
				grace = true
			}
			break;
		case BULLET_TYPE.RED:
			/*
				if instant_kill
					hp = 0
				else
					maxhp -= 2;
			*/
			break;
	}
}