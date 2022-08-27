


// Inherit the parent event
event_inherited();

if (x < -128 || room_width + 128 < x || y < -128)
{
	instance_destroy();
}
if (room_height < y)
{
	velocity.y *= -1
	image_angle = point_direction(0, 0, velocity.x, velocity.y)
}