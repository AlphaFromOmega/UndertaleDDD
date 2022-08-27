// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function factorial(_x)
{
    if (_x <= 1) return 1;
    else return _x * factorial(_x - 1);
}
function revert(_x, _max)
{
	return (_max * ceil(abs(_x)/_max) + _x) % _max;
}

function vector_around_point(_origin, _point, _angle)
{
	return new Vector2((_point.x -_origin.x) * cos(_angle) - (_point.y -_origin.y) * sin(_angle), (_point.y -_origin.y) * cos(_angle) + (_point.x -_origin.x) * sin(_angle))
}