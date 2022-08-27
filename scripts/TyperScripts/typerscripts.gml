// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function text_get_type(_typer)
{
	var _type = new TextProperties(fnt_main, c_black, room_width, 0, 1, noone, new Vector2(16, 32));
	switch (_typer)
	{
		case 1:
			var _s = 4;
			var _boxScale = obj_bulletboard.boxScaleDest;
			_type = new TextProperties(fnt_main, c_white, _boxScale.x * 1.25, 0, 1, noone, new Vector2(8 * _s, 16 * _s), new Vector2(_s, _s));
			break;
		case 2:
			_type.font = fnt_plain;
			break;
	}
	return _type
}
/// @func								TextProperties(font, colour, writing_position, x_end, shake, speed, sound, spacing, vspacing);
/// @desc								Creates a structure for text typer properties.
/// @param {real}  font					The id of the font to be used.
/// @param {real}  colour				The default colour of the text.
/// @param {real} x_end					The max x position of the text. Text longer than this will wrap.
/// @param {real} shake					The animation the text will play.
/// @param {real} speed					The speed of the typewriter.
/// @param {real} sound					The sound that plays with the typewriter.
/// @param {Vector2} spacing			The horizontal spacing of the characters.

function TextProperties(_font, _colour, _xend, _shake, _speed, _sound, _spacing, _scale = new Vector2(2, 2)) constructor
{
	font = _font
	colour = _colour
	writingxend = _xend
	shake = _shake
	speed = _speed
	sound = _sound
	spacing = _spacing
	vtext = 0
	scale = _scale
	flag = -1;
}

function create_typer(_x, _y, _depth, _text, _typer = 0)
{
	if (is_numeric(_typer))
	{
		_typer = text_get_type(_typer);
	}
	if (!is_array(_text))
	{
		_text = [_text]
	}
	return instance_create_depth(_x, _y, _depth, obj_typer,
	{
		text : _text,
		textType : _typer,
	});
}

function get_button_string(_string)
{
	// Replace with button keys once a control setup is implimented
	// If languages are added also impliment them with it
	_string = string_replace_all(_string, "@*Z", "[Z]");
	_string = string_replace_all(_string, "@*X", "[X]");
	_string = string_replace_all(_string, "@*C", "[C]");
	
	_string = string_replace_all(_string, "@*H", "[LEFT @& RIGHT]");
	_string = string_replace_all(_string, "@*V", "[UP @& DOWN]");
	
	_string = string_replace_all(_string, "@*W", "[UP]");
	_string = string_replace_all(_string, "@*A", "[LEFT]");
	_string = string_replace_all(_string, "@*S", "[DOWN]");
	_string = string_replace_all(_string, "@*D", "[RIGHT]");
	return _string;
}
function new_line()
{
	if (textType.vtext)
	{
	    myx -= textType.spacing.y
	    myy = x
	}
	else
	{
	    myx = x
	    myy += textType.spacing.y
	}

}

function jitter(_amount, _offset)
{
	if (random(1) <= _amount)
	{
		return (random(2) - 1) * _offset;
	}
	return 0;
}