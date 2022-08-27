

alarm[0] = 1;
triggered = true;
if (name != "")
{
	atkName = instance_create_depth(room_width * 2/3 - 16, 16, depth - 1000, obj_attackname)
	atkName.name = name
}