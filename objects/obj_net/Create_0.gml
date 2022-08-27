

soul = obj_soul;
bb = obj_bulletboard;
if (autoScale && instance_exists(obj_bulletboard))
{
	x = obj_bulletboard.x;
	y = obj_bulletboard.y;
	size = new Vector2(bb.boxScale.x - 96, bb.boxScale.y - 128);
}