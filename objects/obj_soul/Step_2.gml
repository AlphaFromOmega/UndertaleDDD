

previous.x = x
previous.y = y
var vel = new Vector2(velocity.x, velocity.y);
var velPart = new Vector2(velocity.x, velocity.y);
if (velPart.x != 0 || velPart.y != 0)
{
	velPart = velPart.normalize();
}
for (var i = 0; i < vel.length(); i++;)
{
	var dif = min(vel.length() - i, 1);
	var newPos = new Vector2(x + velPart.x * dif, y + velPart.y * dif);
	if (!place_meeting(newPos.x, newPos.y, obj_bbcollider))
	{
		x = newPos.x;
		y = newPos.y;
	}
	else
	{
		if (!place_meeting(x, newPos.y, obj_bbcollider))
		{
			y = newPos.y;
		}
		else
		{
			grounded = true;
		}
		if (!place_meeting(newPos.x, y, obj_bbcollider))
		{
			x = newPos.x;
		}
	}
}