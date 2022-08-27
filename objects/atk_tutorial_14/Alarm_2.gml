

audio_stop_sound(sfx_fire_tan)
audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
var deg = 24;
var pos = new Vector2(earnaro.x, earnaro.y + earnaroHandOffset.y);
for (var i = 0; i < 5; i++;)
{
	var bul = instance_create_depth(pos.x, pos.y, bb.depth - 10, obj_orbitbullet);
	bul.sprite_index = spr_tutorial_bullet;
	bul.radius = room_height * 2/3 * (oMax + 1 - abs(oSpeed));
	bul.orbitPoint.x = pos.x + lengthdir_x(bul.radius, (-i * deg) + (-90 * oSpeed/oMax) + rot)
	bul.orbitPoint.y = pos.y + lengthdir_y(bul.radius, (-i * deg) + (-90 * oSpeed/oMax) + rot)
	bul.orbitSpeed = sign(oSpeed) * oMax
	bul.maxLife = 200
	bul.life = bul.maxLife
	bul.damage =  earnaro.atk
	bul.sprite_index = spr_tutorial_bullet2
	bul.tagID = 2; 
}
rot += (deg * 5)

fired++;

if (64 < fired && fired <= 112)
{
	oSpeed = lerp(oMax, -oMax, (fired - 64)/48);
	alarm[2] = 6
}
else if (fired <= 176)
{
	alarm[2] = 4
}
else
{
	alarm[3] = 4
}