

switch (state)
{
	case BATTLE_STATE.MENU:
	{
		targets = 0;
		bb.boxPosDest.x = defaultPos.x;
		bb.boxPosDest.y = defaultPos.y;
		bb.boxScaleDest.x = defaultScale.x;
		bb.boxScaleDest.y = defaultScale.y;
		if (lastState != state)
		{
			lastState = state;
		}
		if ((!instance_exists(menuTyper) || oldMsg != msg) && (bb.x == bb.boxPosDest.x && bb.y == bb.boxPosDest.y && bb.boxScale.x == bb.boxScaleDest.x && bb.boxScale.y == bb.boxScaleDest.y))
		{
			instance_destroy(menuTyper);
			oldMsg = msg;
			menuTyper = create_typer(bb.x + 44 - bb.boxScale.x/2, bb.y + 32 - bb.boxScale.y/2, depth - 1, msg, 1);
		}
		
		if (sign(global.controlPressed[CONTROL.AXIS].x) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80, 0.5, VOLUME_TYPE.SFX, false);
			selected = revert(selected + sign(global.controlPressed[CONTROL.AXIS].x), array_length(buttons));
		}
		
		soul.x = buttons[selected].instance.x - 38 * buttons[selected].instance.image_xscale;
		soul.y = buttons[selected].instance.y;
		if (global.controlPressed[CONTROL.Z])
		{
			instance_destroy(menuTyper);
			audio_play_sound_volume(sfx_battle_select, 80,  0.5, VOLUME_TYPE.SFX, false);
			if (!buttons[selected].useMonsterMenu || enemies <= 1)
			{
				menuSelected = buttons[selected].state;
				enemySelected = 0;
				state = buttons[selected].state;
			}
			else
			{
				menuSelected = buttons[selected].state;
				state = BATTLE_STATE.SELECT;
			}
		}
		break;
	}
	case BATTLE_STATE.SELECT:
	{
		if (lastState != state)
		{
			for (var i = 0; i < array_length(global.enemies); i++;)
			{
				if (!instance_exists(global.enemies[i]))
				{
					break;
				}
				multiTyper[i] = create_typer(bb.x - bb.boxScale.x/2 + 64, bb.y - bb.boxScale.y/2 + 32 + i * 64, depth - 1, "* " + global.enemies[i].name, 1);
				multiTyper[i].stringPos = string_length(multiTyper[i].originalString)
			}
			lastState = state;
		}
		
		if (sign(global.controlPressed[CONTROL.AXIS].y) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80,  0.5, VOLUME_TYPE.SFX, false);
			selected = revert(selected + sign(global.controlPressed[CONTROL.AXIS].y), array_length(global.enemies));
		}
		soul.x = bb.x - bb.boxScale.x/2 + 64;
		soul.y = bb.y - bb.boxScale.y/2 + 64 + selected * 64;
		if (global.controlPressed[CONTROL.Z])
		{
			for (var i = 0; i < array_length(multiTyper); i++;)
			{
				instance_destroy(multiTyper[i])
			}
			audio_play_sound_volume(sfx_battle_select, 80, 0.5, VOLUME_TYPE.SFX, false);
			enemySelected = selected;
			state = menuSelected;
		}
		if (global.controlPressed[CONTROL.X])
		{
			for (var i = 0; i < array_length(multiTyper); i++;)
			{
				instance_destroy(multiTyper[i])
			}
			state = BATTLE_STATE.MENU;
			selected = menuSelected - 2;
		}
		break;
	}
	case BATTLE_STATE.FIGHT:
	{
		if (random(1) < 0.1 && targets < 1)
		{
			show_debug_message("Bar Fired")
			instance_create_depth(bb.x - bb.boxScale.x/2, bb.y, depth - 1, obj_targetbar);
			targets++;
		}
		if (targets >= 1 && !instance_exists(obj_targetbar))
		{
			state = BATTLE_STATE.DIALOG;
		}
		break;
	}
	case BATTLE_STATE.ACT:
	{
		if (lastState != state)
		{
			for (var i = 0; i < array_length(global.enemies[enemySelected].actChoice); i++;)
			{
				multiTyper[i] = create_typer(bb.x + 128 + (bb.boxScaleDest.x/2 * ((i % 2) - 1)), bb.y + 32 - bb.boxScaleDest.y/2 + i div 2 * (bb.boxScaleDest.y - 128)/3, depth - 1, global.enemies[enemySelected].actChoice[i], 1);
				
				multiTyper[i].stringPos = string_length(multiTyper[i].originalString)
				show_debug_message(multiTyper[i].originalString)
			}
			lastState = state;
			selected = 0;
		}
		
		if (sign(global.controlPressed[CONTROL.AXIS].x) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80, 0.5, VOLUME_TYPE.SFX, false);
			var ns = (selected - selected % 2) + (selected % 2 + sign(global.controlPressed[CONTROL.AXIS].x))
			if (ns >= array_length(multiTyper))
			{
				ns = array_length(multiTyper) - 2
			}
			selected = revert(ns, array_length(global.enemies[enemySelected].actChoice))
		}
		if (sign(global.controlPressed[CONTROL.AXIS].y) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80, 0.5, VOLUME_TYPE.SFX, false);
			selected = revert(selected + sign(global.controlPressed[CONTROL.AXIS].y) * 2, array_length(global.enemies[enemySelected].actChoice))
		}
		
		soul.x = bb.x + (bb.boxScaleDest.x/2 * ((selected % 2) - 1)) + 64;
		soul.y = bb.y + 60 - bb.boxScaleDest.y/2 + (selected div 2) * (bb.boxScaleDest.y - 128)/3;
		
		if (global.controlPressed[CONTROL.Z])
		{
			state = BATTLE_STATE.TEXT;
			menuTyper = create_typer(bb.x + 44 - bb.boxScale.x/2, bb.y + 32 - bb.boxScale.y/2, depth - 1, global.enemies[enemySelected].actText[selected], 1);
			soul.image_alpha = 0;
			soul.immortal = true;
			for (var i = 0; i < array_length(global.enemies[enemySelected].actChoice); i++;)
			{
				instance_destroy(multiTyper[i])
			}
		}
		if (global.controlPressed[CONTROL.X])
		{
			for (var i = 0; i < array_length(global.enemies[enemySelected].actChoice); i++;)
			{
				instance_destroy(multiTyper[i])
			}
			if (enemies <= 1)
			{
				state = BATTLE_STATE.MENU;
				selected = menuSelected - 2;
			}
			else
			{
				state = BATTLE_STATE.SELECT;
				selected = enemySelected;
			}
		}
		break;
	}
	case BATTLE_STATE.ITEM:
	{
		if (lastState != state)
		{
			items = [];
			for (var i = 0; i < array_length(global.items); i++;)
			{
				if (instance_exists(global.items[i]))
				{
					var p = array_length(items);
					items[p] = global.items[i];
					multiTyper[i] = create_typer(bb.x + 128 + (bb.boxScaleDest.x/2 * ((i % 2) - 1)), bb.y + 32 - bb.boxScaleDest.y/2 + i div 2 * (bb.boxScaleDest.y - 128)/3, depth - 1, items[p].getName(), 1);
					multiTyper[i].stringPos = string_length(multiTyper[i].originalString)
					show_debug_message(multiTyper[i].originalString)
				}
			}
			selected = 0;
			if (array_length(items) == 0)
			{
				state = BATTLE_STATE.MENU;
				selected = menuSelected - 2;
				break;
			}
			else
			{
				lastState = state;
			}
		}
		
		if (sign(global.controlPressed[CONTROL.AXIS].x) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80, 0.5, VOLUME_TYPE.SFX, false);
			var ns = (selected - selected % 2) + (selected % 2 + sign(global.controlPressed[CONTROL.AXIS].x))
			if (ns >= array_length(multiTyper))
			{
				ns = array_length(multiTyper) - 2
			}
			selected = revert(ns, array_length(items))
		}
		if (sign(global.controlPressed[CONTROL.AXIS].y) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80, 0.5, VOLUME_TYPE.SFX, false);
			selected = revert(selected + sign(global.controlPressed[CONTROL.AXIS].y) * 2, array_length(items))
		}
		
		soul.x = bb.x + (bb.boxScaleDest.x/2 * ((selected % 2) - 1)) + 64;
		soul.y = bb.y + 60 - bb.boxScaleDest.y/2 + (selected div 2) * (bb.boxScaleDest.y - 128)/3;
		
		if (global.controlPressed[CONTROL.Z])
		{
			state = BATTLE_STATE.TEXT;
			menuTyper = create_typer(bb.x + 44 - bb.boxScale.x/2, bb.y + 32 - bb.boxScale.y/2, depth - 1, items[selected].getUse(), 1);
			items[selected].typer = menuTyper;
			soul.image_alpha = 0;
			soul.immortal = true;
			for (var i = 0; i < array_length(items); i++;)
			{
				instance_destroy(multiTyper[i])
			}
		}
		if (global.controlPressed[CONTROL.X])
		{
			for (var i = 0; i < array_length(items); i++;)
			{
				instance_destroy(multiTyper[i])
			}
			state = BATTLE_STATE.MENU;
			selected = menuSelected - 2;
		}
		break;
	}
	case BATTLE_STATE.MERCY:
	{
		if (lastState != state)
		{
			var choices = ["* Skip Turn"]
			
			
			for (var i = 0; i < array_length(choices); i++;)
			{
				multiTyper[i] = create_typer(bb.x + 128 + (bb.boxScaleDest.x/2 * ((i % 2) - 1)), bb.y + 32 - bb.boxScaleDest.y/2 + i div 2 * (bb.boxScaleDest.y - 128)/3, depth - 1, choices[i], 1);
				multiTyper[i].stringPos = string_length(multiTyper[i].originalString)
			}
			lastState = state;
			selected = 0;
		}
		
		if (sign(global.controlPressed[CONTROL.AXIS].y) != 0)
		{
			audio_play_sound_volume(sfx_battle_switch, 80,  0.5, VOLUME_TYPE.SFX, false);
			selected = revert(selected + sign(global.controlPressed[CONTROL.AXIS].y), array_length(global.enemies));
		}
		
		soul.x = bb.x - bb.boxScale.x/2 + 64;
		soul.y = bb.y - bb.boxScale.y/2 + 60 + selected * 64;
		
		if (global.controlPressed[CONTROL.Z])
		{
			audio_play_sound_volume(sfx_battle_select, 80, 0.5, VOLUME_TYPE.SFX, false);
			state = BATTLE_STATE.TEXT;
			soul.image_alpha = 0;
			soul.immortal = true;
			for (var i = 0; i < array_length(global.enemies[enemySelected].actChoice); i++;)
			{
				instance_destroy(multiTyper[i])
			}
		}
		if (global.controlPressed[CONTROL.X])
		{
			for (var i = 0; i < array_length(multiTyper); i++;)
			{
				instance_destroy(multiTyper[i])
			}
			state = BATTLE_STATE.MENU;
			selected = menuSelected - 2;
		}
		break;
	}
	case BATTLE_STATE.TEXT:
	{
		if (!instance_exists(menuTyper))
		{
			state = BATTLE_STATE.DIALOG;
			soul.image_alpha = 1;
			soul.immortal = false;
		}
		break;
	}
	case BATTLE_STATE.DIALOG:
	{
		if (!instance_exists(par_bubble))
		{
			state = BATTLE_STATE.BATTLE;
			if (instance_exists(par_attack))
			{
				with (par_attack)
				{
					event_user(0)
				}
			}
			else
			{
				state = BATTLE_STATE.MENU;
			}
		}
		break;
	}
}
