

if (abs(boxScale.x - boxScaleDest.x) > scaleGrad * 64)
{
	boxScale.x = lerp(boxScale.x, boxScaleDest.x, scaleGrad);
}
else
{
	boxScale.x = boxScaleDest.x;
}
if (abs(boxScale.y - boxScaleDest.y) > scaleGrad * 64)
{
	boxScale.y = lerp(boxScale.y, boxScaleDest.y, scaleGrad);
}
else
{
	boxScale.y = boxScaleDest.y;
}
if (boxScale.x == boxScaleDest.x && boxScale.y == boxScaleDest.y)
{
	scaleGrad = 0.1;
}
else
{
	scaleGrad += 0.001;
	if (surface_exists(mask))
	{
		surface_set_target(mask);
	}
	else
	{
		mask = surface_create(room_width, room_height);
		surface_set_target(mask);
	}
	draw_clear_alpha(c_white, 0);
	var xh = sprite_get_width(sprite_index)/3;
	var yh = sprite_get_height(sprite_index)/3;
	draw_sprite_ext(pixel, 0, x + xh - boxScale.x/2, y + yh - boxScale.y/2, boxScale.x - (xh * 2), boxScale.y - (yh * 2), boxAngle, c_white, 1);
	surface_reset_target();
}

if (abs(x - boxPosDest.x) > posGrad * 64)
{
	x = lerp(x, boxPosDest.x, posGrad);
}
else
{
	x = boxPosDest.x;
}
if (abs(y - boxPosDest.y) > posGrad * 64)
{
	y = lerp(y, boxPosDest.y, posGrad);
}
else
{
	y = boxPosDest.y;
}
if (x == boxPosDest.x && y == boxPosDest.y)
{
	posGrad = 0.1;
}
else
{
	posGrad += 0.001;
}
modify_box_collision();