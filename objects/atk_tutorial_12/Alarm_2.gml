


for (var i = 0; i < 2; i++;)
{
	var bDir = dir + i * 180
	var d = new Vector2(lengthdir_x(1, bDir), lengthdir_y(1, bDir))
	var bul = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bounce_bullet);
	bul.image_xscale = 8
	bul.image_yscale = 0.1
	bul.x += lengthdir_x(bul.sprite_width/2,bDir)
	bul.y += lengthdir_y(bul.sprite_width/2,bDir)
	bul.image_angle = bDir
	bul.velocity.x = d.x * 16
	bul.velocity.y = d.y * 16
	bul.persists = true
	bul.damage = earnaro.atk
}

switch (phase)
{
	case 0:
	{
		target = 120
		laserSpeed = 1/(room_speed*6)
		break
	}
	case 1:
	{
		target = -120
		laserSpeed = 1/(room_speed*12)
		break
	}
}

var channel = animcurve_get_channel(animcurve_get(ac_easeinandout), "d")
dir = lerp(oDir, target, animcurve_channel_evaluate(channel, curvePostion))
curvePostion += laserSpeed
if (curvePostion > 1)
{
	oDir = dir
	curvePostion = 0
	phase++;
	if (phase == 1)
	{
		audio_play_sound_volume(sfx_fire_boon, 40, 1, VOLUME_TYPE.SFX, false)
	}
}
if (phase < 2)
{
	alarm[2] = 1
}
else
{
	audio_play_sound_volume(sfx_fire_boon_alt, 40, 1, VOLUME_TYPE.SFX, false)
	alarm[3] = room_speed * 3
}