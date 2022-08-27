

if (shots_fired >= 6 && !instance_exists(par_bullet) && !instance_exists(obj_brokenpiece))
{
	instance_destroy();
}