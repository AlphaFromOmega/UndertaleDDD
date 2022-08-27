

draw_reset();
switch (state)
{
	case TUTORIALINTRO_STATES.TEXT_DISPLAY:
		draw_sprite_pscaled(pixel, 0, 0, 0, room_width, room_height, 0, c_black, 1);
		for (var i = 0; i <= textShow; i++;)
		{
			if (i == textShow ^^ fadeOut)
			{
				draw_set_alpha(textAlpha);
			}
			else
			{
				draw_set_alpha(textAlpha2);
			}
			draw_text_transformed(128, 32 + 64 * i, text[i], 4, 4, 0);
		}
		break;
	case TUTORIALINTRO_STATES.EANARO_INTRO:
		// Background
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		var bgWidth = room_width + 512;
		for (var i = 0; i < array_length(bgBinaryBuffer); i++;)
		{
			for (var j = 0; j < array_length(bgBinaryBuffer[i]); j++;)
			{
				var textPos = new Vector2(((bgBinaryDelta + j * bgWidth/(array_length(bgBinaryBuffer[i]))) % bgWidth) - 256, room_height/7 + i * ((room_height - room_height/7) / array_length(bgBinaryBuffer)));
				var s = min(abs((textPos.x/room_width - 0.5) * 2), 1);
				textPos.y -= s * s * (room_height/2 - textPos.y)/room_height * 128;
				draw_text_transformed_color(textPos.x, textPos.y, string(bgBinaryBuffer[i][j].value), s * 2 + 6, s * 2 + 6, 0, c_teal, c_teal, c_teal, c_teal, bgBinaryBuffer[i][j].alpha);
			}
		}
		break;
	case TUTORIALINTRO_STATES.BATTLE_1: case TUTORIALINTRO_STATES.INTERMISSION:
		draw_sprite_pscaled(pixel, 0, 0, 0, room_width, room_height, 0, c_black, 1);
		
		if (!surface_exists(surfaceBackground))
		{
			surfaceBackground = surface_create(room_width, room_height)
		}
		surface_set_target(surfaceBackground)
		draw_clear_alpha(c_black, 0);
		draw_sprite_pscaled(pixel, 0, 0, 0, room_width, room_height, 0, c_black, 1);
		gpu_set_blendmode(bm_add);
		for (var i = 0; i < 36; i++;)
		{
			for (var j = 0; j < array_length(bg) - 1; j++;)
			{
				draw_sprite_ext(spr_tutorial_bg_part_0, 0, room_width/2, room_height/2 - 128, bg[j][0][i].x, bg[j][0][i].y, (10 + bg[j][1][i]) * i + rot / (1 + j), bgColours[bgColour], (j + 1) * 0.04 * bgAlpha);
				draw_sprite_ext(spr_tutorial_bg_part_0, 0, room_width/2 - 128, room_height/2, bg[j][0][i].x, bg[j][0][i].y, (10 + bg[j][1][i]) * i + rot / (1 + j), bgColours[bgColour], (j + 1) * 0.04 * bgAlpha);
				draw_sprite_ext(spr_tutorial_bg_part_0, 0, room_width/2 + 128, room_height/2, bg[j][0][i].x, bg[j][0][i].y, (10 + bg[j][1][i]) * i + rot / (1 + j), bgColours[bgColour], (j + 1) * 0.04 * bgAlpha);
			}
		}
		for (var i = 0; i < 100; i++;)
		{
			draw_text_transformed_color(random(room_width), random(room_height), floor(random(2)), 4, 4, 0, bgColours[bgColour], bgColours[bgColour], bgColours[bgColour], bgColours[bgColour], 0.1 * bgAlpha);
		}
		
	    gpu_set_blendmode(bm_normal);
		surface_reset_target();
		
		draw_reset()
		draw_surface(surfaceBackground, 0, 0)
		shader_reset();
		
		if (debug_mode)
		{
			draw_reset()
			draw_text_transformed_color(256, 32, attack, 8, 8, 0, c_red, c_red, c_red, c_red, 1);
		}
		break;
	case TUTORIALINTRO_STATES.BATTLE_2:
	{
		draw_sprite_pscaled(pixel, 0, 0, 0, room_width, room_height, 0, c_black, 1);
		var horizonCenter = new Vector2(room_width/2, room_height * 0.55)
		var floorAmount = 16
		switch (bgMode)
		{
			case 0:
			{
				draw_set_valign(fa_center)
				draw_set_halign(fa_center)
				for (var i = 0; i < array_length(bgBinary3D); i++;)
				{
					draw_set_color(c_white);
					var depthifier = sqrt(BGMAXZ);
					draw_text_transformed_color(room_width/2 + ((bgBinary3D[i].x - room_width/2) * bgBinary3D[i].z * 2/BGMAXZ), room_height/2 + ((bgBinary3D[i].y - room_height/2) * bgBinary3D[i].z * 2/BGMAXZ), bgBinary3D[i].value, (bgBinary3D[i].z/depthifier) + 1, (bgBinary3D[i].z/depthifier) + 1, 0, c_white, c_white, c_white, c_white, min(bgBinary3D[i].z * 16/BGMAXZ, 1))
				}
				
				for (var j = 0; j < floorAmount; j++;)
				{
					var tHeight = sqr(j + bgMove) * 48/floorAmount
					var bHeight = sqr(j + 1 + bgMove) * 48/floorAmount;
					var plainAlpha = (j + bgMove)/floorAmount
					for (var i = -floorAmount/2 - 0.5; i < floorAmount/2; i++;)
					{
						var nextPos = i + 1
						
						var pointTL = vector_around_point(horizonCenter, new Vector2(horizonCenter.x + i * room_width/floorAmount + (tHeight * i), horizonCenter.y + tHeight), bgAngle);
						var pointTR = vector_around_point(horizonCenter, new Vector2(horizonCenter.x + nextPos  * room_width/floorAmount + (tHeight * nextPos), horizonCenter.y + tHeight), bgAngle);
						if (pointTR.x + horizonCenter.x  < 0 || pointTL.x + horizonCenter.x > room_width)
						{
							continue
						}
						
						var pointBL = vector_around_point(horizonCenter, new Vector2(horizonCenter.x + i * room_width/floorAmount + bHeight * i, horizonCenter.y + bHeight), bgAngle);
						var pointBR = vector_around_point(horizonCenter, new Vector2(horizonCenter.x + nextPos * room_width/floorAmount + bHeight * nextPos, horizonCenter.y + bHeight), bgAngle);
						
						draw_sprite_pos(spr_tutorial_plainbackground, 0, pointTL.x + horizonCenter.x, pointTL.y + horizonCenter.y, pointTR.x + horizonCenter.x, pointTR.y + horizonCenter.y, pointBR.x + horizonCenter.x, pointBR.y + horizonCenter.y, pointBL.x + horizonCenter.x, pointBL.y + horizonCenter.y, plainAlpha)
					}
				}
				break;
			}
			case 1:
			{
				var bgAmount = array_length(pathwayImages)
				
				var dis = room_width/64
				draw_set_circle_precision(180)
				for (var i = 0; i < 64; i++;)
				{
					draw_set_alpha((64 - i)/64);
					draw_circle(room_width/2, room_height/2, dis * (i - (bgMove * 2) % 1), true);
				}
				
				for (var i = 0; i < array_length(lineDirection); i++;)
				{
					draw_set_alpha(lineAlpha[i])
					draw_line_width(room_width/2, room_height/2, room_width/2 + lengthdir_x(room_width, lineDirection[i]), room_height/2 + lengthdir_y(room_width, lineDirection[i]), lineWidth[i])
				}
				draw_set_alpha(1)
				for (var i = 0; i < floorAmount; i++;)
				{
					var tHeight = sqr(i + bgMove) * 32/floorAmount
					var plainAlpha = (i + bgMove)/floorAmount
						
					var pointTL = new Vector2(horizonCenter.x + -0.5 * room_width/floorAmount + (tHeight * -0.5), horizonCenter.y + tHeight);
					var pointTR = new Vector2(horizonCenter.x + 0.5 * room_width/floorAmount + (tHeight * 0.5), horizonCenter.y + tHeight);
					
					var bHeight = sqr(i + 1 + bgMove) * 32/floorAmount;
					var pointBL = new Vector2(horizonCenter.x + -0.5 * room_width/floorAmount + bHeight * -0.5, horizonCenter.y + bHeight)
					var pointBR = new Vector2(horizonCenter.x + 0.5 * room_width/floorAmount + bHeight * 0.5, horizonCenter.y + bHeight)
					
					draw_sprite_pos(spr_tutorial_plainbackground, 0, pointTL.x, pointTL.y, pointTR.x, pointTR.y, pointBR.x, pointBR.y, pointBL.x, pointBL.y, 1)
				}
				draw_reset()
				for (var i = 0; i < bgAmount; i++;)
				{
					var z = lerp(i + imageMove, sqr(i + imageMove), 0.5)
					var tWidth = z * (room_width/bgAmount) * 0.5
					var s = (i + imageMove)/3
					for (var j = 0; j < 2; j++;)
					{
						var even = j * 2 - 1
						draw_sprite_ext(spr_tutorial_timeline, pathwayImages[i], room_width/2 + tWidth * even, room_height/2, s, s, 0, c_white, 1);
					}	
				}
				break;
			}
			case 2:
			{
				break;
			}
		}
		if (debug_mode)
		{
			draw_reset()
			draw_text_transformed_color(256, 32, attack, 8, 8, 0, c_red, c_red, c_red, c_red, 1);
		}
		break;
	}
	case TUTORIALINTRO_STATES.END:
	{
		if (endState < 7 || 9 < endState)
		{
			draw_sprite_pscaled(pixel, 0, 0, 0, room_width, room_height, 0, c_black, 1);
		}
		else
		{
			draw_set_valign(fa_center);
			draw_set_halign(fa_center);
			var bgWidth = room_width + 512;
			for (var i = 0; i < array_length(bgBinaryBuffer); i++;)
			{
				for (var j = 0; j < array_length(bgBinaryBuffer[i]); j++;)
				{
					var textPos = new Vector2(((bgBinaryDelta + j * bgWidth/(array_length(bgBinaryBuffer[i]))) % bgWidth) - 256, room_height/7 + i * ((room_height - room_height/7) / array_length(bgBinaryBuffer)));
					var s = min(abs((textPos.x/room_width - 0.5) * 2), 1);
					textPos.y -= s * s * (room_height/2 - textPos.y)/room_height * 128;
					draw_text_transformed_color(textPos.x, textPos.y, string(bgBinaryBuffer[i][j].value), s * 2 + 6, s * 2 + 6, 0, c_teal, c_teal, c_teal, c_teal, bgBinaryBuffer[i][j].alpha);
				}
			}
			
		}
		if (endState >= 10)
		{
			for (var i = 0; i <= textShow; i++;)
			{
				draw_set_alpha(1)
				if (i == textShow)
				{
					draw_set_alpha(textAlpha);
				}
				draw_text_transformed(128, 32 + 64 * i, key_to_text("tutorial_finalblurb_" + string(i)), 4, 4, 0);
			}
		}
		break;
	}
}