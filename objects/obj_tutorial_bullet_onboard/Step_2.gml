


// Inherit the parent event
event_inherited();

if (spawned && place_meeting(x, y, obj_bbcollider))
{
	edge = true;
}
if (!place_meeting(x, y, obj_bbcollider))
{
	spawned = true
	if (edge)
	{
		instance_destroy();
	}
}