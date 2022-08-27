/// @description Bullet Fire
earnaro.sprite_index = spr_tutorial_earnaro_fire
audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);

var deg = 360/MAX_BULLETS

for (var j = 1; j <= 2; j++;)
{
	signEven = ((j % 2) * 2 - 1)
	for (var i = 0; i < MAX_BULLETS; i++;)
	{
		var pos = new Vector2(earnaro.x, earnaro.y + earnaroHandOffset.y)
		var bul = instance_create_depth(pos.x, pos.y, bb.depth - 10, obj_orbitbullet);
		bul.sprite_index = spr_tutorial_bullet
		bul.radius = room_width/2
		bul.orbitPoint.x = pos.x + lengthdir_x(bul.radius, i * deg)
		bul.orbitPoint.y = pos.y + lengthdir_y(bul.radius, i * deg)
		bul.orbitSpeed = -1.25 * signEven * power(j, 1.1)
		bul.life = 480/j
		bul.damage =  earnaro.atk
		bul.sprite_index = spr_tutorial_bullet2
	}
}

for (var i = 0; i < MAX_LARGE_BULLETS; i++;)
{
	var bul = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_tutorial_bullet);
	bul.sprite_index = spr_tutorial_giant_bullet
	bul.image_xscale = 0.25
	bul.image_yscale = 0.25
	bul.persists = true
	bul.velocity.x = lengthdir_x(2 + 2 * global.difficulty, (i + shotsFired/2) * 360/MAX_LARGE_BULLETS);
	bul.velocity.y = lengthdir_y(2 + 2 * global.difficulty, (i + shotsFired/2) * 360/MAX_LARGE_BULLETS);
	bul.damage =  earnaro.atk
}

if (shotsFired % 3 == 0)
{
	audio_play_sound_volume(sfx_fire_laser, 80, 0.5, VOLUME_TYPE.SFX, false);
	var deg = 360/MAX_TRAIL_BULLETS
	var o = random(deg)
	for (var i = 0; i < MAX_TRAIL_BULLETS; i++;)
	{
		var pos = new Vector2(earnaro.x, earnaro.y + earnaroHandOffset.y)
		var bul = instance_create_depth(pos.x, pos.y, bb.depth - 10, obj_orbitspawnbullet);
		bul.sprite_index = spr_tutorial_bullet
		bul.radius = room_height * 2/3
		bul.orbitPoint.x = pos.x + lengthdir_x(bul.radius, (i * deg) + o)
		bul.orbitPoint.y = pos.y + lengthdir_y(bul.radius, (i * deg) + o)
		bul.orbitSpeed = -3 * (((shotsFired div 3) % 2) * 2 - 1)
		bul.image_xscale = 0.5
		bul.image_yscale = 1
		bul.life = 240
		bul.persists = true
		bul.damage = earnaro.atk
	}
}

shotsFired++;
if (shotsFired < MAX_SHOTS)
{
	alarm[1] = 60
}
else
{
	earnaro.sprite_index = spr_tutorial_earnaro_cape
	alarm[2] = 300
}
