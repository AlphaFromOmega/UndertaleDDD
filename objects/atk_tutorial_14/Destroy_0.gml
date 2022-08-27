


// Inherit the parent event
event_inherited();

with (par_bullet)
{
	instance_destroy()
}
with (obj_kanjidecor)
{
	instance_destroy()
}

instance_destroy(obj_battle_controller);
obj_tutorial_battle.state = TUTORIALINTRO_STATES.END;