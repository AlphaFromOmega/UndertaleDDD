/// @description ?
for (var i = position; i < array_length(global.items) - 1; i++;)
{
	global.items[i] = global.items[i + 1];
	if (instance_exists(global.items[i]))
	{
		global.items[i].position = i;
	}
}