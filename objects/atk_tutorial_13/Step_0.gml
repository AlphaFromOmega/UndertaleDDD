

if (spawned && !completed)
{
	completed = true
	for (var i = 0; i < array_length(sigils); i++;)
	{
		if (sigils[i].enabled)
		{
			completed = false
			break;
		}
	}
	if (completed)
	{
		alarm[2] = 30;
	}
}
