/// @description Reset Position
var dir = point_direction(orbitPoint.x, orbitPoint.y, x, y)
x = orbitPoint.x + lengthdir_x(radius, dir)
y = orbitPoint.y + lengthdir_y(radius, dir)
