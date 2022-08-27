

if (autoScale && instance_exists(bb))
{
	x = obj_bulletboard.x;
	y = obj_bulletboard.y;
	size = new Vector2(bb.boxScale.x - 96, bb.boxScale.y - 128);
}

soul.x = clamp(soul.x, x - size.x/2, x + size.x/2);
soul.netPos = clamp(soul.netPos, 0, lines - 1);
soul.y = soul.netPos * (size.y / (lines - 1)) + y - size.y/2;