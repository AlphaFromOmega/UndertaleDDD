

#macro BCONTROL obj_battle_controller
defaultScale = new Vector2(room_width * 0.75, room_height / 4);
defaultPos = new Vector2(room_width /2, room_height * 0.75);
enum BATTLE_STATE
{
	MENU,
	SELECT,
	FIGHT,
	ACT,
	ITEM,
	MERCY,
	TEXT,
	DIALOG,
	BATTLE
}

state = BATTLE_STATE.MENU;
lastState = state;
menuTyper = noone;
multiTyper[5] = noone;
oldMsg = msg;
selected = 0;
menuSelected = -1;
enemySelected = noone;

items = [];

bb = instance_create_depth(defaultPos.x, defaultPos.y, depth + 1, obj_bulletboard);

buttons =	[
				new Button(instance_create_depth(0, 0, depth - 1, obj_fightbt), BATTLE_STATE.FIGHT, true),
				new Button(instance_create_depth(0, 0, depth - 1, obj_talkbt), BATTLE_STATE.ACT, true),
				new Button(instance_create_depth(0, 0, depth - 1, obj_itembt), BATTLE_STATE.ITEM, false),
				new Button(instance_create_depth(0, 0, depth - 1, obj_sparebt), BATTLE_STATE.MERCY, false),
			]


buttonSize = new Vector2(sprite_get_width(buttons[0].instance.sprite_index) * buttons[0].instance.image_xscale, sprite_get_height(buttons[0].instance.sprite_index) * buttons[0].instance.image_yscale);
var conWidth = bb.boxScale.x - buttonSize.x;
var base = (room_width - conWidth)/2;
for (var i = 0; i < array_length(buttons); i++;)
{
	buttons[i].instance.x = base + conWidth * i/(array_length(buttons) - 1);
	buttons[i].instance.y = bb.y + bb.boxScale.y/2 + buttonSize.y;
}
soul = instance_create_depth(buttons[0].instance.x - 74 * buttonSize.x, buttons[0].instance.y, depth - 100, obj_soul);
enemies = 0;
for (var i = 0; i < array_length(global.enemies); i++;)
{
	enemies++;
}

targets = 0;

global.maxHp = (global.love < 20) ? (global.love - 1) * 4 + 20 : 99;
global.hp = global.maxHp;

page = 0;

healthBar = instance_create_depth(12, 8, depth - 1000, obj_healthbar)

global.atk += (global.love - 1) * 2
global.def += global.love div 4