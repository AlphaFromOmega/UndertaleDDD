event_inherited();

change_music(mus_tutorial1);

global.love = 1

var startItems = (4 - global.difficulty) * 2
for (var i = 0; i < startItems - 1; i++;)
{
	global.items[i] = instance_create_depth(0, 0, depth, itm_croquetroll);
}

enum TUTORIALINTRO_STATES
{
	TEXT_DISPLAY,
	EANARO_INTRO,
	BATTLE_1,
	INTERMISSION,
	BATTLE_2,
	END
}
state = TUTORIALINTRO_STATES.TEXT_DISPLAY;

array_delete(global.enemies, 0, array_length(global.enemies));

earnaro = instance_create_depth(room_width/2, room_height/2 + sprite_get_height(spr_tutorial_earnaro)*3/2, depth - 100, obj_tutorial_earnaro);
earnaro.image_alpha = 0;
earnaro.image_blend = c_aqua;
earnaroAlpha = 0;
global.enemies[0] = earnaro;

fade = instance_create_depth(0, 0, depth - 10000, obj_fade);
fade.image_alpha = 0;
fadeAlpha = 0;


text = ["* You wake up...", "* It's as if you don't know anything anymore.", "* \"Who am I?\"", "* \"Why am I here?\"","* \"What is my... Destiny?\"",];
textShow = 1;
textTimer = 3 * room_speed;
textAlpha = -3;
textAlpha2 = 1;
fadeOut = false;


for (var i = 0; i < 5; i++;)
{
	for (var j = 0; j < 20; j++;)
	{
		bgBinaryBuffer[i][j] = new BinaryBackground(floor(random(2)), floor(random(2)), 0);
	}
}
bgBinaryPosition = 0;
bgBinaryDelta = 0;
bgColours = [c_white, c_aqua, make_colour_rgb(255, 153, 0) /*Orange*/, c_blue, c_lime, c_purple, c_yellow]
bgColour = 0;
textbox = true;
introState = 0;

for (var i = 0; i < 36; i++;)
{
	bg[0][0][i] = new Vector2(random_range(64, 128), random_range(240, 300));
	bg[1][0][i] = new Vector2(random_range(32, 64), random_range(140, 180));
	bg[2][0][i] = new Vector2(random_range(16, 32), random_range(120, 140));
	bg[3][0][i] = new Vector2(random_range(8, 16), random_range(60, 120));
	
	bg[0][1][i] = 0;
	bg[1][1][i] = random_range(0, 5);
	bg[2][1][i] = random_range(5, 15);
	bg[3][1][i] = random_range(15, 30);
	for (var j = 0; j < 4; j++;)
	{
		bg[j][2][i] = new Vector2(1, 1);
	}
}
bgMod = factorial(array_length(bg));
rot = 0;

attack = 0;
attacks = [atk_tutorial_0, atk_tutorial_1, atk_tutorial_2, atk_tutorial_3, atk_tutorial_4, atk_tutorial_5, atk_tutorial_6]
attacks2 = [atk_tutorial_7, atk_tutorial_8, atk_tutorial_9, atk_tutorial_10, atk_tutorial_11, atk_tutorial_12, atk_tutorial_13, atk_tutorial_14]
attacked = false;

bgAlpha = 1;
intermissionState = 0;
bgMove = 0;

bgAngleMax = degtorad(0.025);
bgAngleAmount = 0;
bgAngle = 0;

bgMode = 0


#macro BGMAXZ room_width
var b = 256
var z = 2
for (var i = 0; i < b; i++;)
{
	var z = random(BGMAXZ)
	while (sqr(z) > random(BGMAXZ))
	{
		z = random(BGMAXZ)
	}
	bgBinary3D[i] = new Binary3DBackground(room_width/2 + random_range(-room_width * 16, room_width * 16), room_height/2 + random_range(-room_height * 16, room_height * 16), z, floor(random(2)));
}

imageMove = 0;

for (var i = 0; i < 8; i++;)
{
	pathwayImages[i] = floor(random(4.0))
}

for (var i = 0; i < 64; i++;)
{
	lineDirection[i] = random(360);
	lineWidth[i] = random(8) + 8;
	lineAlpha[i] = random_range(0.25, 0.75);
}

surfaceBackground = surface_create(room_width, room_height)
volume = 1;

endState = 0;