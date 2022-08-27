

draw_reset();
var baseY = y - size.y/2;
var multiY = size.y / (lines - 1);
for (var i = 0; i < lines; i++;)
{
	draw_line_width_color(x - size.x/2, baseY + multiY * i, x + size.x/2, baseY + multiY * i, 2, c_fuchsia, c_fuchsia);
}