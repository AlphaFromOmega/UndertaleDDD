


// Inherit the parent event
event_inherited();

if (x < bb.x - bb.boxScale.x/2 || bb.x + bb.boxScale.x/2 < x  || y < bb.y - bb.boxScale.y/2 || bb.y + bb.boxScale.y/2 < y )
{
	instance_destroy();
}