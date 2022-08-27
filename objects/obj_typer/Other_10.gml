switch (halt)
{
	case 1:
	    stringNo++;
	    originalString = get_button_string(text[stringNo]);
	    stringPos = 0;
	    halt = false;
	    alarm[0] = textType.speed;
		break;
	case 2:
	    instance_destroy();
		break;
	case 4:
		global.myfight = 0;
	    global.mnfight = 1;
	    instance_destroy();
		break;
	default:
		break;
}