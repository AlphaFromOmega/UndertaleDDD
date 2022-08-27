

if (image_speed > 0)
{
	if (image_index >= (image_number - 1/sprite_get_speed(sprite_index)))
	{
		image_speed *= -1
	}
}
else
{
	if (image_index <= 1/sprite_get_speed(sprite_index))
	{
		image_speed *= -1
	}
}