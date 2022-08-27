

draw_self()
var c = cos(degtorad(-image_angle))
var s = sin(degtorad(-image_angle))

var tP1 = new Vector2(9.5 * image_xscale, 9.5 * image_yscale)
var point1 = new Vector2()

point1.x = tP1.x * c - tP1.y * s
point1.y = tP1.x * s + tP1.y * c

var tP2 = new Vector2(5.5 * image_xscale, -2.5 * image_yscale)
var point2 = new Vector2()

point2.x = tP2.x * c - tP2.y * s
point2.y = tP2.x * s + tP2.y * c

draw_line_width_color(x + point1.x, y + point1.y, x + point2.x, y + point2.y, image_xscale, image_blend, image_blend)