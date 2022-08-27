

if (!next)
{
	if (alpha < 1)
	{
		alpha += 0.025;
	}
	else if (alpha2 < 1)
	{
		alpha = 1;
		alpha2 += 0.05;
	}
	else
	{
		next = true;
		alpha = 0;
		alpha2 = 1;
		room_goto(roomDest)
	}
}
else
{
	alpha2 -= 0.05;
	if (alpha2 <= 0)
	{
		instance_destroy();
	}
}
