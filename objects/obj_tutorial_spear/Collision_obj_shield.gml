

var spd = velocity.length();
velocity.x = lengthdir_x(spd, other.direction);
velocity.y = lengthdir_y(spd, other.direction);
reflected = true;

with (other)
{
	event_user(0)
}