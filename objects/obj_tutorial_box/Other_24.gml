


// Inherit the parent event
event_inherited();

bp = instance_create_depth(x, y, depth, obj_brokenpiece);
if instance_exists(bp)
{
	bp.sprite_index = sprite_index;
	bp.image_xscale = image_xscale;
	bp.image_yscale = image_yscale;
}
audio_play_sound_volume(sfx_box_destroy, 40, 1, VOLUME_TYPE.SFX, false);
instance_destroy();