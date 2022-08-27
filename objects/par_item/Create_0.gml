typer = noone;
state = -1;
event_user(0);
event_user(1);
event_user(2);
event_user(3);
var i = 0;
while (i < array_length(global.items))
{
	if (!instance_exists(global.items[i]))
	{
		break;
	}
	i++;
}
position = i;