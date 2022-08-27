


switch (state)
{
	case TUTORIALINTRO_STATES.TEXT_DISPLAY:
	{
		if (global.controlPressed[CONTROL.Z] && textShow != 4)
		{
			textShow = 4;
			textTimer = 0;
			textAlpha = 1;
		}
		if (textTimer > 0)
		{
			if (fadeOut)
			{
				textAlpha -= 0.025;
			}
			else
			{
				textAlpha += 0.025;
			}
			textTimer--;
		}
		else
		{
			if (fadeOut)
			{
				textAlpha2 -= 0.01;
				if (textAlpha2 <= 0)
				{
					state = TUTORIALINTRO_STATES.EANARO_INTRO;
					fadeAlpha = 1;
					change_music(mus_tutorial2);
				}
			}
			else
			{
				switch (textShow)
				{
					case 1:
						textShow++;
						textTimer = 3 * room_speed;
						textAlpha = -3;
						break;
					case 2: case 3:
						textShow++;
						textTimer = 1 * room_speed;
						textAlpha = 0;
						break;
					case 4:
						textTimer = 3 * room_speed;
						textAlpha = 3;
						fadeOut = true;
						break;
				}
			}
		}
		break;
	}
	case TUTORIALINTRO_STATES.EANARO_INTRO:
	{
		switch (introState)
		{
			case 0:
				fadeAlpha -= 0.005;
				if (fadeAlpha <= 0)
				{
					fadeAlpha = 0;
					introState++;
				}
				break;
			case 1:
				earnaroAlpha += 0.005;
				if (earnaroAlpha >= 1)
				{
					earnaroAlpha = 1;
					var text;
					for (i = 0; i <= 21; i++;)
					{
						text[i] = key_to_text("tutorial_intro_spe_" + string(i))
					}
		            blcon = instance_create_depth(earnaro.x + 30 * earnaro.image_xscale, earnaro.y - 172 * earnaro.image_yscale, earnaro.depth - 1, obj_blconwide);
		            blwrite = create_typer(blcon.x + 30 * blcon.image_xscale, blcon.y + 10 * blcon.image_yscale, earnaro.depth - 2, text);
					introState++;
				}
				break;
			case 2:
				if !(instance_exists(blwrite))
				{
				    with (blcon)
					{
				        instance_destroy()
					}
					introState++;	
				}
				break;
			case 3:
				fadeAlpha += 0.005;
				if (fadeAlpha >= 1)
				{
					fadeAlpha = 1;
					state = TUTORIALINTRO_STATES.BATTLE_1;
					battle = instance_create_depth(0, 0, depth - 500, obj_battle_controller);
					instance_destroy(obj_healthbar)
					battle.msg = ""
					change_music(mus_tutorial3);
					earnaro.y = room_height/2;
				}
				break;
				
		}
		
		bgBinaryDelta++;
		for (var i = 0; i < 5; i++;)
		{
			for (var j = 0; j < 20; j++;)
			{
				if (bgBinaryBuffer[i][j].alphaDelta != 0)
				{
					bgBinaryBuffer[i][j].alpha += bgBinaryBuffer[i][j].alphaDelta;
					if (bgBinaryBuffer[i][j].alpha >= 1)
					{
						bgBinaryBuffer[i][j].alpha = 1
						bgBinaryBuffer[i][j].alphaDelta = 0;
					}
					else if (bgBinaryBuffer[i][j].alpha <= 0)
					{
						bgBinaryBuffer[i][j].alpha = 0
						bgBinaryBuffer[i][j].alphaDelta = 0;
						
						bgBinaryBuffer[i][j].value = floor(random(2));
					}
				}
				else
				{
					if (random(1) < 0.1)
					{
						bgBinaryBuffer[i][j].alphaDelta = -(bgBinaryBuffer[i][j].alpha * 2 - 1) * random(0.01);
					}
				}
			}
		}
		break;
	}
	case TUTORIALINTRO_STATES.BATTLE_1:
	{
		fadeAlpha -= 0.01;		
		rot++;
		rot %= 360 * bgMod;
		for (var i = 0; i < array_length(bg[0][0]); i++;)
		{
			for (var j = 0; j < array_length(bg) - 1; j++;)
			{
				if (random(1) < 0.1)
				{
					bg[j][2][i].x = random_range(0.999, 1.001);
				}
				if (random(1) < 0.01)
				{
					bg[j][2][i].y = random_range(0.999, 1.001);
				}
				bg[j][0][i].x *= bg[j][2][i].x;
				bg[j][0][i].y *= bg[j][2][i].y;
			}
		}
		battle.msg = key_to_text("tutorial_battle_fla_" + string(attack))
		switch (battle.state)
		{
			case BATTLE_STATE.BATTLE:
				attacked = false;
				break;
			case BATTLE_STATE.DIALOG:
				if !(attacked)
				{
					var i = 0;
					do
					{
						var key = "tutorial_battle_spe_" + string(attack) + "_" + string(i);
						show_debug_message(key_to_text(key))
						text[i] = key_to_text(key);
						i++;	
					}
					until (!key_exists(key));
			        blcon = instance_create_depth(earnaro.x + 30 * earnaro.image_xscale, earnaro.y - 172 * earnaro.image_yscale, earnaro.depth - 1, obj_blconwide);
			        blwrite = create_typer(blcon.x + 30 * blcon.image_xscale, blcon.y + 10 * blcon.image_yscale, earnaro.depth - 2, text);
					instance_create_depth(0, 0, depth, attacks[attack])
					attack++;
					attacked = true;
				}
				if (!instance_exists(blwrite))
				{
					instance_destroy(blcon)
				}
				break;
			case BATTLE_STATE.MENU:
				if (debug_mode)
				{
					attack = revert(attack + keyboard_check_pressed(vk_pageup) - keyboard_check_pressed(vk_pagedown), array_length(attacks));
				}
				break;
		}		
		earnaro.image_blend = bgColours[bgColour];
		break;
	}
	case TUTORIALINTRO_STATES.INTERMISSION:
	{
		if (bgAlpha > 0)
		{
			change_music(noone);
			earnaro.image_blend = c_white;
			bgAlpha -= 0.025;
		}
		else
		{
			switch (intermissionState)
			{
				case 0:
				{
					for (i = 0; i <= 10; i++;)
					{
						text[i] = key_to_text("tutorial_intermissionspeech_" + string(i))
					}
		            blcon = instance_create_depth(earnaro.x + 30 * earnaro.image_xscale, earnaro.y - 172 * earnaro.image_yscale, earnaro.depth - 1, obj_blconwide);
		            blwrite = create_typer(blcon.x + 30 * blcon.image_xscale, blcon.y + 10 * blcon.image_yscale, earnaro.depth - 2, text);
					intermissionState++;
					break;
				}
				case 1:
				{
					if (blwrite.stringNo == 2)
					{
						change_music(mus_tutorial4);
					}
					if !(instance_exists(blwrite))
					{
					    with (blcon)
						{
					        instance_destroy()
						}
						instance_destroy(fade);
						fade = instance_create_depth(0, 0, depth - 10000, obj_fade);
						fadeAlpha = 0;
						intermissionState++;	
					}
					break;
				}
				case 2:
				{
					if (fadeAlpha < 1)
					{
						fadeAlpha += 0.025;
					}
					else
					{
						earnaro.sprite_index = spr_tutorial_earnaro_cape;
						earnaro.y = room_height/2 + 32;
						attack = 0;
						var n = global.name
						global.name = ""
						battle = instance_create_depth(0, 0, depth - 500, obj_battle_controller);
						battle.msg = ""
						global.name = n
						change_music(mus_tutorial5);
						state = TUTORIALINTRO_STATES.BATTLE_2;
						fadeAlpha = 1;
					}
				}
			}
		}
		break;
	}
	case TUTORIALINTRO_STATES.BATTLE_2:
	{
		switch (bgMode)
		{
			case 0:
			{
				bgMove = (bgMove + 0.05) % 1;
				fadeAlpha -= 0.01;
				for (var i = 0; i < array_length(bgBinary3D); i++;)
				{
					bgBinary3D[i].z = lerp(bgBinary3D[i].z, sqr(bgBinary3D[i].z), 0.01/room_speed)
					if (random(1) < 0.01)
					{
						bgBinary3D[i].value = !bgBinary3D[i].value
					}
					if (bgBinary3D[i].z > BGMAXZ)
					{
						bgBinary3D[i] = new Binary3DBackground(room_width/2 + random_range(-room_width * 16, room_width * 16), room_height/2 + random_range(-room_height * 16, room_height * 16), random_range(8, 16), floor(random(2)));
					}
				}
				if ((attack == 1 && battle.state < BATTLE_STATE.DIALOG) || attack > 1)
				{
					bgAngle += bgAngleAmount;
					bgAngleAmount = lerp(bgAngleAmount, bgAngleMax, 1/room_speed);
					if (abs(bgAngle) > degtorad(10))
					{
						bgAngleMax = abs(bgAngleMax) * -sign(bgAngle);
					}
				}
				break;
			}
			case 1:
			{
				bgMove = (bgMove + 0.05) % 1;
				var mov = (imageMove + 0.01)
				if (mov != (mov % 1))
				{
					for (var i = array_length(pathwayImages) - 2; i >= 0; i--;)
					{
						pathwayImages[i + 1] = pathwayImages[i];
					}
					var n = floor(random(4.0));
					if (pathwayImages[0] == n)
					{
						n = (n + 1) % 4;
					}
					pathwayImages[0] = n;
				}
				imageMove = mov % 1;
				break;
			}
		}
		
		
		battle.msg = key_to_text("tutorial_battle2_fla_" + string(attack))
		switch (battle.state)
		{
			case BATTLE_STATE.BATTLE:
				attacked = false;
				break;
			case BATTLE_STATE.DIALOG:
				if !(attacked)
				{
					var i = 0;
					instance_create_depth(0, 0, depth, attacks2[attack])
					attack++;
					attacked = true;
				}
				if (!instance_exists(blwrite))
				{
					instance_destroy(blcon)
				}
				break;
			case BATTLE_STATE.MENU:
				if (debug_mode)
				{
					attack = revert(attack + keyboard_check_pressed(vk_pageup) - keyboard_check_pressed(vk_pagedown), array_length(attacks2));
				}
				break;
		}	
		break;
	}
	case TUTORIALINTRO_STATES.END:
	{
		switch (endState)
		{
			case 0:
			{
				change_music(noone);
				earnaro.sprite_index = spr_tutorial_earnaro;
				alarm[0] = 1;
				endState++;
				break;
			}
			case 2:
			{
				if !(instance_exists(blwrite))
				{
				    with (blcon)
					{
				        instance_destroy()
					}
					endState++;	
					fade = instance_create_depth(0, 0, depth - 10000, obj_fade);
					fadeAlpha = 0;
				}
				break;
			}
			case 3:
			{
				fadeAlpha += 0.01;
				if (fadeAlpha >= 1)
				{
					fadeAlpha = 1;
					earnaro.y = room_height/2 + sprite_get_height(spr_tutorial_earnaro)*3/2;
					instance_create_depth(0, 0, depth - 20, obj_battlemenu_geno, {controllable : false})
					endState++;	
				}
				break;
			}
			case 4:
			{
				fadeAlpha -= 0.01;
				if (fadeAlpha <= 0)
				{
					fadeAlpha = 0;
					var text;
					for (var i = 0; i <= 9; i++;)
					{
						text[i] = key_to_text("tutorial_endmenu_spe_" + string(i))
					}
					blcon = instance_create_depth(earnaro.x + 30 * earnaro.image_xscale, earnaro.y - 172 * earnaro.image_yscale, earnaro.depth - 1, obj_blconwide);
					blwrite = create_typer(blcon.x + 30 * blcon.image_xscale, blcon.y + 10 * blcon.image_yscale, earnaro.depth - 2, text);
					endState++;
				}
				break;
			}
			case 5:
			{
				if !(instance_exists(blwrite))
				{
				    with (blcon)
					{
				        instance_destroy()
					}
					endState++;	
					fade = instance_create_depth(0, 0, depth - 10000, obj_fade);
					fadeAlpha = 0;
				}
				break;
			}
			case 6:
			{
				fadeAlpha += 0.01;
				if (fadeAlpha >= 1)
				{
					fadeAlpha = 1;
					instance_destroy(obj_battlemenu_geno);
					endState++;	
				}
				break;
			}
			case 7:
			{
				fadeAlpha -= 0.01;
				if (fadeAlpha <= 0)
				{
					fadeAlpha = 0;
					var text;
					for (var i = 0; i <= 9; i++;)
					{
						text[i] = key_to_text("tutorial_final_spe_" + string(i))
					}
					blcon = instance_create_depth(earnaro.x + 30 * earnaro.image_xscale, earnaro.y - 172 * earnaro.image_yscale, earnaro.depth - 1, obj_blconwide);
					blwrite = create_typer(blcon.x + 30 * blcon.image_xscale, blcon.y + 10 * blcon.image_yscale, earnaro.depth - 2, text);
					endState++;
				}
				break;
			}
			case 8:
			{
				if !(instance_exists(blwrite))
				{
				    with (blcon)
					{
				        instance_destroy()
					}
					endState++;	
					fade = instance_create_depth(0, 0, depth - 10000, obj_fade);
					fadeAlpha = 0;
				}
				break;
			}
			case 9:
			{
				fadeAlpha += 0.01;
				if (fadeAlpha >= 1)
				{
					fadeAlpha = 0;
					earnaroAlpha = 0;
					textShow = 0;
					textAlpha = -1;
					endState++;	
				}
				break;
			}
			case 10:
			{
				if (textAlpha < 1)
				{
					textAlpha += 0.025;
				}
				else if (textShow < 6)
				{
					textAlpha = -2;
					textShow++;
				}
				else
				{
					alarm[2] = room_speed;
					endState++;
				}
				break;
			}
			case 12:
			{
				instance_create_depth(0, 0, depth, obj_transition_level, {roomDest: rm_name})
				endState++;
				break;
			}
		}
		
		bgBinaryDelta++;
		for (var i = 0; i < 5; i++;)
		{
			for (var j = 0; j < 20; j++;)
			{
				if (bgBinaryBuffer[i][j].alphaDelta != 0)
				{
					bgBinaryBuffer[i][j].alpha += bgBinaryBuffer[i][j].alphaDelta;
					if (bgBinaryBuffer[i][j].alpha >= 1)
					{
						bgBinaryBuffer[i][j].alpha = 1
						bgBinaryBuffer[i][j].alphaDelta = 0;
					}
					else if (bgBinaryBuffer[i][j].alpha <= 0)
					{
						bgBinaryBuffer[i][j].alpha = 0
						bgBinaryBuffer[i][j].alphaDelta = 0;
						
						bgBinaryBuffer[i][j].value = floor(random(2));
					}
				}
				else
				{
					if (random(1) < 0.1)
					{
						bgBinaryBuffer[i][j].alphaDelta = -(bgBinaryBuffer[i][j].alpha * 2 - 1) * random(0.01);
					}
				}
			}
		}
		break;
	}
}

fade.image_alpha = fadeAlpha;
earnaro.image_alpha = earnaroAlpha;
