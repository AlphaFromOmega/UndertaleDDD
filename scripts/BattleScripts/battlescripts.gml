// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Button(_instance, _state, _useMonsterMenu) constructor
{
	instance = _instance;
	state = _state;
	useMonsterMenu = _useMonsterMenu;
}
function attack_soul(_dmg, _ins, _unavoidable)
{
	if (!_ins.immortal)
	{
		if (_dmg > 0)
		{
			_dmg = max(_dmg - global.def, 1)		
		}
		// ATTACK
		if (_unavoidable)
		{
			global.hp = clamp(global.hp - _dmg, 1, global.maxHp)
		}
		else
		{
			global.hp = clamp(global.hp - _dmg, 0, global.maxHp)
		}
		if (instance_exists(par_battle))
		{
			par_battle.noHit = false;
		}
	}
	_ins.inv = 16;
	if !(persists)
	{
		instance_destroy();
	}
	audio_play_sound_volume(sfx_battle_hurt, 80, 0.5, VOLUME_TYPE.SFX, false);
}
function modify_box_collision()
{
	collider[0].image_xscale = boxScale.x;
	collider[0].image_yscale = 7;
	collider[0].x = x - boxScale.x/2;
	collider[0].y = y - boxScale.y/2;
	collider[0].direction = boxAngle;

	collider[1].image_xscale = 7;
	collider[1].image_yscale = boxScale.y;
	collider[1].x = x - boxScale.x/2;
	collider[1].y = y - boxScale.y/2;
	collider[1].direction = boxAngle;

	collider[2].image_xscale = boxScale.x;
	collider[2].image_yscale = 7;
	collider[2].x = x - boxScale.x/2;
	collider[2].y = y + boxScale.y/2 - 7;
	collider[2].direction = boxAngle;

	collider[3].image_xscale = 7;
	collider[3].image_yscale = boxScale.y;
	collider[3].x = x + boxScale.x/2 - 7;
	collider[3].y = y - boxScale.y/2;
	collider[3].direction = boxAngle;
}
function get_net_pos(_pos, _net)
{
	return _pos * (_net.size.y / (_net.lines - 1)) + _net.y - _net.size.y/2;
}