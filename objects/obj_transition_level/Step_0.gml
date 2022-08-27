

if (!next)
{
	if (alpha < 1)
	{
		alpha += 0.025;
	}
	else
	{
		next = true;
		alpha = 1;
		room_goto(roomDest)
	}
}
else
{
	alpha -= 0.025;
	if (alpha <= 0)
	{
		instance_destroy();
	}
}