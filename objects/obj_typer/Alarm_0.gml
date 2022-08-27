
var advance, doSound, delay, ch, n, sfxType, sfx;
if (stringPos >= string_length(originalString))
{
	exit
}
advance = 1
/*
if (global.typer == 111)
 advance += 1
if (txtsound == snd_mtt1)
 advance += 2
else if (txtsound == snd_tem)
 advance += 1
*/
doSound = 0;
delay = textType.speed;
while (stringPos < string_length(originalString) && advance > 0)
{
	stringPos++;
	ch = string_char_at(originalString, stringPos);
	if (ch == "^")
	{
		stringPos++;
		ch = string_char_at(originalString, stringPos);
		if (ch != "0")
		{
			n = real(ch);
			delay = (n * 10);
			advance = 1;
		}
	}
	else if (ch == "@")
	{
		stringPos++;
		ch = string_char_at(originalString, stringPos);
		if (ch == "S")
		{
			stringPos++;
			sfxType = string_char_at(originalString, stringPos);
			if (sfxType == "+")
			{
				soundEnable = 1;
			}
			else if (sfxType == "-")
			{
				soundEnable = 0;
			}
			else
			{
				sfx = noone;
				if (sfxType == "p")
				{
				//sfx = snd_phone
				}
				if (sfx != noone)
				{
					audio_play_sound(sfx, 80, false)
				}
			}
		}
		else if (ch == "z")
		{
			stringPos++
			advance--
			if (soundEnable)
			{
				doSound = 1
			}
		}
		else if (ch == "E" || ch == "F" || ch == "M" || ch == "T" || ch == "*")
		{
			stringPos++
		}
		else
		{
			doSound = 1
		}
	}
	else if (ch != "/" && ch != "%" && ch != "&")
	{
		advance--
		if (soundEnable)
		{
			doSound = 1
		}
	}
}
alarm[0] = delay
if (doSound)
{
	ch = string_char_at(originalString, stringPos)
	if (ch != " " && ch != "　")
	{
		if (is_array(textType.sound))
		{
			for (var i = 0; i < array_length(textType.sound); i++;)
			{
				audio_stop_sound(textType.sound[i])
			}
			audio_play_sound(textType.sound[floor(random(array_length(textType.sound)))], 80, false)
		}
		else
		{
			if (audio_exists(textType.sound))
			{
				audio_stop_sound(textType.sound)
				audio_play_sound(textType.sound, 80, false)
			}
		}
	}
}
