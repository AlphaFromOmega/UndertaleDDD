

if (begin_fire)
{
	audio_play_sound_volume(sfx_fire_tan, 80, 0.1, VOLUME_TYPE.SFX, false);
	var bul = instance_create_depth(room_width/2, -64, bb.depth - 10, obj_tutorial_box);
	bul.velocity.y = 8;
	bul.damage = 0;
	shots_fired++;
}
else
{
	begin_fire = true
}

if (shots_fired < 6)
{
	alarm[0] = room_speed/2;
}