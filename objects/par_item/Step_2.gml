/// @description State Manager
		
if (state >= 0)
{
	if (!instance_exists(typer))
	{
		switch (state)
		{
			case 0:
			{
				// Description
				typer = noone;
				state = -1;
				break;
			}
			case 1:
			{
				// Use
				instance_destroy()
				break;
			}
			case 2:
			{
				// Drop
				instance_destroy()
				break;
			}
		}
	}
}