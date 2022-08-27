

draw_reset();

var sa = -degtorad(boxAngle);
var sAdjust = new Vector2(boxScale.x * cos(sa) - boxScale.y * sin(sa), boxScale.x * sin(sa) + boxScale.y * cos(sa));
draw_sprite_pscaled(sprite_index, 0, x - sAdjust.x/2, y - sAdjust.y/2, boxScale.x, boxScale.y, boxAngle, c_white, 1);