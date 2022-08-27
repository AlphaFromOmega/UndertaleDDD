


// Inherit the parent event
event_inherited();

if (x < -128 || room_width + 128 < x || y < -128 || room_height + 128 < y )
{
	instance_destroy();
}