

cornerOffset = new Vector2(room_width/2, -room_height/2);
targetPosition = 32;
x = -(cornerOffset.x + targetPosition);
y = room_height - 32;

cornerPosition = new Vector2();
cornerPosition.x = x + cornerOffset.x;
cornerPosition.y = y + cornerOffset.y;

cornerOffset2 = new Vector2(room_width/5, -room_height/2);
cornerPosition2 = new Vector2();
cornerPosition2.x = x + cornerOffset2.x;
cornerPosition2.y = y + cornerOffset2.y;

menuAlpha = 1;
menuOptions = ["Audio", "Video", "Controls", "Exit"]

enum SETTINGS_VALUES
{
	NONE,
	BOOL,
	LIST,
	SLIDER
}

menuSettings[0] = [["Master Volume", SETTINGS_VALUES.SLIDER, global.volumeSlider[0]], ["Music", SETTINGS_VALUES.SLIDER, global.volumeSlider[1]], ["SFX", SETTINGS_VALUES.SLIDER, global.volumeSlider[2]], ["Voices", SETTINGS_VALUES.SLIDER, global.volumeSlider[3]]]
menuSettings[1] = [["Fullscreen", SETTINGS_VALUES.BOOL, window_get_fullscreen()]]
menuSettings[2] = [["Controls", SETTINGS_VALUES.NONE]]
for (var i = 0; i < array_length(menuSettings); i++;)
{
	menuSettings[i][array_length(menuSettings[i])] = ["Back", SETTINGS_VALUES.NONE]
}
menuSelected[0] = 0;
menuSelected[1] = 0;

enum SETTINGS_STATE
{
	MENU,
	ALTMENU,
	EXIT
}
state = SETTINGS_STATE.MENU;