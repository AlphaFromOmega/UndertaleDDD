/// @description Heal
getUse = function()
{
	state = 1;
	audio_play_sound_volume(sfx_heal, 40, 0.5, VOLUME_TYPE.SFX, false);
	global.hp = clamp(global.hp + healAmount, 0, global.maxHp);
	var u
	if (global.serious && global.inbattle)
	{
		if (!is_array(useText))
		{
			u[0] = seriousUseText;
		}
		else
		{
			u = seriousUseText;
		}
	}
	else
	{
		if (!is_array(useText))
		{
			u[0] = useText;
		}
		else
		{
			u = useText;
		}
	}
	var t = ""
	if (global.hp == global.maxHp)
	{
		t = "* Your HP was maxed out!/%" 
	}
	else
	{
		t = "* You recovered " + string(healAmount) + " HP!/%" 
	}
	if (string_count("&", u[array_length(u) - 1]) >= 2)
	{
		u[array_length(u)] = "/" + t
	}
	else
	{
		u[array_length(u) - 1] += "&" + t
	}
	return u;
}