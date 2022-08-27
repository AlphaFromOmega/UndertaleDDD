soul.x = bb.x
soul.y = bb.y

if (created)
{
	if (!instance_exists(lastBullet) || lastBullet.reflected)
	{
		alarm[1] = room_speed
		created = false
	}
}
