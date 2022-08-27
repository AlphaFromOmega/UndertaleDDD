
// You can write your code in this edito
global.difficulty = 1;
global.music = noone;
global.language = "en";
global.inbattle = true;
global.serious = false;
if (!variable_global_exists("text_data_en"))
{
    textdata_en();
}

#region Controls
	global.controlPressed[2] = 0;
	global.control[2] = 0;

	enum CONTROL
	{
		Z,
		X,
		C,
		AXIS
	}
	global.control[CONTROL.AXIS] = new Vector2();
	lastGamepad = new Vector2(0, 0);
	lastDpad = new Vector2(0, 0);
#endregion

destRoom = rm_startmenu
global.gameStats = ds_map_create()
global.gameStats[? "tutorial"] = new BattleStats();
global.gameStats[? "genotoriel"] = new BattleStats();


global.name = "Chara"

global.love = 0;
global.maxHp = 0;
global.atk = 0;
global.def = 0;
global.inv = 0;
global.attackType = 0;
global.items = [noone, noone, noone, noone, noone, noone, noone, noone];

global.enemies[5] = noone;

global.volume[1] = global.volumeSlider[0] * global.volumeSlider[1]
global.volume[2] = global.volumeSlider[0] * global.volumeSlider[2]
global.volume[3] = global.volumeSlider[0] * global.volumeSlider[3]

global.vGroup[1] = ag_music
global.vGroup[2] = ag_sfx
global.vGroup[3] = ag_voice

audio_group_set_gain(ag_music, global.volume[1], 0);
audio_group_set_gain(ag_sfx, global.volume[2], 0);

load_game();
save_game();