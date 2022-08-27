

if (lastRadius != radius)
{
	event_user(0)
	lastRadius = radius;
}
var dir = point_direction(orbitPoint.x, orbitPoint.y, x, y)
image_angle = dir + 45

velocity.x = lengthdir_x(radius, dir + orbitSpeed/(radius/128)) - lengthdir_x(radius, dir)
velocity.y = lengthdir_y(radius, dir + orbitSpeed/(radius/128)) - lengthdir_y(radius, dir)

life--;

if life <= 0
{
	instance_destroy()
}
