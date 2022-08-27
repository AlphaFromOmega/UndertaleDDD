

earnaro.sprite_index = spr_tutorial_earnaro_tpose
audio_play_sound_volume(sfx_fire_explosion, 40, 1, VOLUME_TYPE.SFX, false)

var pos = new Vector2(earnaro.x, earnaro.y + earnaroHandOffset.y);
for (var i = 0; i < 8; i++;)
{
	var decor = instance_create_depth(pos.x + lengthdir_x(1, i * 45), pos.y + lengthdir_y(1, i * 45), earnaro.depth - 1, obj_kanjidecor);
	decor.orbitPoint.x = pos.x;
	decor.orbitPoint.y = pos.y;
}
alarm[10] = room_speed * 2;