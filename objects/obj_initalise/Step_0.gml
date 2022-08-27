

if (audio_group_is_loaded(ag_sfx) && audio_group_is_loaded(ag_music))
{
	instance_create_depth(0, 0, 0, obj_global)
	room_goto(obj_global.destRoom)
}


