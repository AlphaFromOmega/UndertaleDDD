

var dir = point_direction(orbitPoint.x, orbitPoint.y, x, y)
if (lastRadius != radius)
{
	event_user(0)
	x = orbitPoint.x + lengthdir_x(radius, dir)
	y = orbitPoint.y + lengthdir_y(radius, dir)

}
x += lengthdir_x(radius, dir + orbitSpeed/(radius/128)) - lengthdir_x(radius, dir);
y += lengthdir_y(radius, dir + orbitSpeed/(radius/128)) - lengthdir_y(radius, dir);

image_alpha += fadeDelta;
if (image_alpha <= 0)
{
	instance_destroy();
}