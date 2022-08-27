

time = 0;
difString = "Unknown";

noHit = true;

switch (global.difficulty)
{
	case 0:
	{
		difString = "Easy"
		break;
	}
	case 1:
	{
		difString = "Normal"
		break;
	}
	case 2:
	{
		difString = "Hard"
		break;
	}
	case 3:
	{
		difString = "Lunatic"
		break;
	}
	case 4:
	{
		difString = "LAST WORD"
		break;
	}
}

var _time = function()
{
    time++;
	var seconds = string(time % 60)
	if (seconds < 10)
	{
		seconds = "0" + seconds;
	}
	var minutes = string(time div 60)
	var t = minutes + ":" + seconds
	if (time > 3600)
	{
		if (minutes < 10)
		{
			minutes = "0" + minutes
		}
		t = string(time div 3600) + ":" + minutes + ":" + seconds
	}
	window_set_caption("UNDERTALE DDD - " + key_to_text(levelid + "_levelname") + " - " + difString + " - Time Spent: " + t)
}
ts = time_source_create(time_source_game, 1, time_source_units_seconds, _time, [], -1)
time_source_start(ts)