draw_reset();
var halfsize, n, ch, myletter, newtyper, sym, symS, icontype, sprite, spritePos, iconScale, choiceIndex, nextch, letterx, offset, halfscale, unit, lastch, angle, displayScale, final;
var lp = false;

spritePos = new Vector2();
offset = new Vector2();
final = new Vector2();

if (textType.vtext)
{
	myx = (textType.writingxend - textType.spacing.y)
}
else
{
	myx = x
}
myy = y
halfsize = 0
n = 1
while (n <= stringPos)
{
	ch = string_char_at(originalString, n)
	myletter = ""
	if (ch == "^" && string_char_at(originalString, (n + 1)) != "0")
	{
		n += 2;
		continue;
	}
	else if (ch == "@")
	{
		lp = false;
		n++
		ch = string_char_at(originalString, n)
		switch (ch)
		{
			default:
				lp = true;
				break;
			case "R":
				textType.colour = c_red;
				break;
			case "G":
				textType.colour = c_lime;
				break;
			case "W":
				textType.colour = c_white;
				break;
			case "Y":
				textType.colour = c_yellow;
				break;
			case "X":
				textType.colour = c_black;
				break;
			case "B":
				textType.colour = c_blue;
				break;
			case "O":
				textType.colour = c_orange;
				break;
			case "L":
				textType.colour = $FDC00E; // Light Blue
				break;
			case "P":
				textType.colour = c_fuchsia;
				break;
			case "p":
				textType.colour = $D4BBFF; // Pink
				break;
			case "C":
				event_user(1)
				break;
			case "M":
				n++;
				ch = string_char_at(originalString, n);
				global.flag[20] = real(ch);
				break;
			case "E":
				n++;
				ch = string_char_at(originalString, n);
				global.faceemotion = real(ch);
				break;
			case "F":
				n++;
				ch = string_char_at(originalString, n);
				global.facechoice = real(ch);
				global.facechange = 1;
				break;
			case "S":
				n++;
				break;
			case "T":
				n++;
				newtyper = string_char_at(originalString, n);
				if (newtyper == "-")
				{
					halfsize = 1
				}
				else if (newtyper == "+")
				{
					halfsize = 0
				}
				else
				{
					switch (newtyper)
					{
						case "T":
							textType.flag = 4
							break;
						case "t":
							textType.flag = 48
							break;
						case "0":
							textType.flag = 5
							break;
						case "S":
							textType.flag = 10
							break;
						case "F":
							textType.flag = 16
							break;
						case "s":
							textType.flag = 17
							break;
						case "P":
							textType.flag = 18
							break;
						case "M":
							textType.flag = 27
							break;
						case "U":
							textType.flag = 37
							break;
						case "A":
							textType.flag = 47
							break;
						case "a":
							textType.flag = 60
							break;
						case "R":
							textType.flag = 76
							break;
					}
					textType = text_get_type(textType.flag)
					global.facechange = 1
				}
				break;
			case "z":
				n++
				sym = real(string_char_at(originalString, n))
				if (sym == 4)
				{
					symS = spr_infinitysign
					draw_sprite_ext(symS, 0, (myx + (random(textType.shake) - (textType.shake / 2))), ((myy + 10) + (random(textType.shake) - (textType.shake / 2))), 2, 2, 0, c_white, 1)
				}
				break;
			case "*":
				n++;
				ch = string_char_at(originalString, n);
				icontype = 0
				if (textType.font == fnt_papyrus || textType.font == fnt_ja_papyrus_btl)
				{
					icontype = 1;
				}
				sprite = scr_getbuttonsprite(ch, icontype)
				if (sprite != -4)
				{
					spritePos.x = myx
					spritePos.y = myy
					if (textType.shake > 38)
					{
						if (textType.shake == 39)
						{
							direction += 10
							spritePos.x += hspeed
							spritePos.y += vspeed
						}
						else if (textType.shake == 40)
						{
							spritePos.x += hspeed
							spritePos.y += vspeed
						}
						else if (textType.shake == 41)
						{
							direction += (10 * n)
							spritePos.x += hspeed
							spritePos.y += vspeed
							direction -= (10 * n)
						}
						else if (textType.shake == 42)
						{
							direction += (20 * n)
							spritePos.x += hspeed
							spritePos.y += vspeed
							direction -= (20 * n)
						}
						else if (textType.shake == 43)
						{
							direction += (30 * n)
							spritePos.x += ((hspeed * 0.7) + 10)
							spritePos.y += (vspeed * 0.7)
							direction -= (30 * n)
						}
					}
					else if (!instance_exists(obj_papdate))
					{
						spritePos.x += (random(textType.shake) - (textType.shake / 2))
						spritePos.y += (random(textType.shake) - (textType.shake / 2))
					}
					iconScale = 1
					if (textType.font == fnt_main || textType.font == fnt_ja_main)
						iconScale = 2
					if (textType.font == fnt_main || textType.font == fnt_maintext)
						spritePos.y += (1 * iconScale)
					if (textType.font == fnt_ja_papyrus_btl)
						spritePos.x -= 1
					if (textType.font == fnt_papyrus && icontype == 1)
						spritePos.y += floor(((16 - sprite_get_height(sprite)) / 2))
					if textType.vtext
					{
						draw_sprite_ext(sprite, 0, (spritePos.x - sprite_get_width(sprite)), spritePos.y, iconScale, iconScale, 0, c_white, 1)
						myy += ((sprite_get_height(sprite) + 1) * iconScale)
					}
					else
					{
						draw_sprite_ext(sprite, 0, spritePos.x, spritePos.y, iconScale, iconScale, 0, c_white, 1)
						myx += ((sprite_get_width(sprite) + 1) * iconScale)
					}
				}
				break;
			case ">":
				n++
				choiceIndex = real(string_char_at(originalString, n))
				if (choiceIndex == 1)
					myx = 196
				else
				{
					myx = 100
					if (textType.font == fnt_ja_comicsans_big)
						myx += 11
				}
				if (view_wport[view_current] == 640)
					myx *= 2
				myx += view_xport[view_current]
				break;
		}
		if (!lp)
		{
			n++;
			continue
		}
	}
	else if (ch == "&")
	{
		new_line();
		n++
		continue
	}
	else if (ch == "/")
	{
		halt = true
		nextch = string_char_at(originalString, (n + 1))
		if (nextch == "%")
			halt = 2
		else if (nextch == "^" && string_char_at(originalString, (n + 2)) != "0")
			halt = 4
		else if (nextch == "*")
			halt = 6
		break
	}
	else if (ch == "%")
	{
		if (string_char_at(originalString, (n + 1)) == "%")
		{
			instance_destroy()
			break
		}
		else
		{
			stringNo++
			originalString = get_button_string(text[stringNo])
			stringPos = 0
			myx = x
			myy = y
			alarm[0] = textType.speed
			break
		}
	}
	else
	{
		lp = true;
	}
	if (lp)
	{
		myletter = string_char_at(originalString, n)
		if (myletter == "^")
			n++
		if ((!textType.vtext) && myx > textType.writingxend)
			new_line();
		letterx = myx
		offset.x = 0
		offset.y = 0
		halfscale = 1
		if halfsize
		{
			halfscale = 0.5
			if textType.vtext
			offset.x += (textType.spacing.y * 0.33)
			else
			offset.y += (textType.spacing.y * 0.33)
		}
		if (global.language == "en")
		{
			if (textType.flag == 18)
			{
				if (myletter == "l" || myletter == "i")
					letterx += 2
				if (myletter == "I")
					letterx += 2
				if (myletter == "!")
					letterx += 2
				if (myletter == ".")
					letterx += 2
				if (myletter == "S")
					letterx += 1
				if (myletter == "?")
					letterx += 2
				if (myletter == "D")
					letterx += 1
				if (myletter == "A")
					letterx += 1
				if (myletter == "'")
					letterx += 1
			}
		}
		else if (global.language == "ja")
		{
			if (textType.vtext && (textType.font == fnt_ja_papyrus || textType.font == fnt_ja_papyrus_btl))
			{
				if (myy == y && (myletter == "「" || myletter == "『"))
					myy -= round((((string_width(myletter) / 2) * textType.scale.x) * halfscale))
			}
			else if (textType.font == fnt_ja_maintext || textType.font == fnt_ja_main)
			{
				unit = (textType.scale.x * halfscale)
				if (textType.font == fnt_ja_main)
					unit *= 2
				if (ord(myletter) < 1024 || ord(myletter) == 8211)
				{
					if (n > 1)
					{
						lastch = ord(string_char_at(originalString, (n - 1)))
						if (lastch >= 1024 && lastch < 65281 && lastch != 8211 && lastch != 12288)
							letterx += unit
					}
				}
			}
		}
		draw_set_font(textType.font) // Needs to be replaced with a script for non latin lanuages
		draw_set_color(textType.colour)
		if (textType.vtext)
			angle = -90
		else
			angle = 0
		if (textType.shake > 38)
		{
			if (textType.shake == 39)
			{
				direction += 10
				offset.x += hspeed
				offset.y += vspeed
			}
			else if (textType.shake == 40)
			{
				offset.x += hspeed
				offset.y += vspeed
			}
			else if (textType.shake == 41)
			{
				direction += (10 * n)
				offset.x += hspeed
				offset.y += vspeed
				direction -= (10 * n)
			}
			else if (textType.shake == 42)
			{
				direction += (20 * n)
				offset.x += hspeed
				offset.y += vspeed
				direction -= (20 * n)
			}
			else if (textType.shake == 43)
			{
				direction += (30 * n)
				offset.x += ((hspeed * 0.7) + 10)
				offset.y += (vspeed * 0.7)
				direction -= (30 * n)
			}
		}
		else
		{
			offset.x += (random(textType.shake) - (textType.shake / 2))
			offset.y += (random(textType.shake) - (textType.shake / 2))
		}
		displayScale = (surface_get_width(application_surface) / view_wport[view_current])
		final.x = (round(((letterx + offset.x) * displayScale)) / displayScale)
		final.y = (round(((myy + offset.y) * displayScale)) / displayScale)
		draw_text_transformed(final.x, final.y, myletter, (textType.scale.x * halfscale), (textType.scale.y * halfscale), angle)
		letterx += textType.spacing.x
		if (global.language == "en")
		{
			if (textType.font == fnt_comicsans)
			{
				if (myletter == "w")
				letterx += 2
				if (myletter == "m")
				letterx += 2
				if (myletter == "i")
				letterx -= 2
				if (myletter == "l")
				letterx -= 2
				if (myletter == "s")
				letterx -= 1
				if (myletter == "j")
				letterx -= 1
			}
			else if (textType.font == fnt_papyrus)
			{
				if (myletter == "D")
				letterx += 1
				if (myletter == "Q")
				letterx += 3
				if (myletter == "M")
				letterx += 1
				if (myletter == "L")
				letterx -= 1
				if (myletter == "K")
				letterx -= 1
				if (myletter == "C")
				letterx += 1
				if (myletter == ".")
				letterx -= 3
				if (myletter == "!")
				letterx -= 3
				if (myletter == "O" || myletter == "W")
				letterx += 2
				if (myletter == "I")
				letterx -= 6
				if (myletter == "T")
				letterx -= 1
				if (myletter == "P")
				letterx -= 2
				if (myletter == "R")
				letterx -= 2
				if (myletter == "A")
				letterx += 1
				if (myletter == "H")
				letterx += 1
				if (myletter == "B")
				letterx += 1
				if (myletter == "G")
				letterx += 1
				if (myletter == "F")
				letterx -= 1
				if (myletter == "?")
				letterx -= 3
				if (myletter == "'")
				letterx -= 6
				if (myletter == "J")
				letterx -= 1
			}
		}
		else if (global.language == "ja")
		{
			if textType.vtext
				myy += round(((string_width(myletter) * textType.scale.x) * halfscale))
			else if (myletter == " " || ord(myletter) >= 65377)
				letterx -= floor((textType.spacing.x / 2))
			else if (ord(myletter) < 1024 || ord(myletter) == 8211)
			{
				if (textType.font == fnt_ja_comicsans || textType.font == fnt_ja_comicsans_big)
					letterx -= floor((textType.spacing.x * 0.3))
				else
					letterx -= floor((textType.spacing.x * 0.4))
			}
		}
		if (!textType.vtext)
		{
			if halfsize
				myx = round((myx + ((letterx - myx) / 2)))
			else
				myx = letterx
		}
		n++
		continue
	}
}
