

switch (state)
{
	case 0:
		x += spd * BCONTROL.bb.boxScale.x/512;
		if (x >= (BCONTROL.bb.x + BCONTROL.bb.boxScale.x/2))
		{
			event_user(0);
		}
		else if (global.controlPressed[CONTROL.Z] && count == 1)
		{
			event_user(0);
		}
		
		if (reduceCount)
		{
			count--;
			reduceCount = false;
		}
		break;
	case 1:
		instance_destroy();
		break;
}