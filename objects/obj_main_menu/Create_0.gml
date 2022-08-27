// State

enum STATES
{
	STORY,
	INTRO,
	MENU,
	ALT_MENU,
}
state = STATES.INTRO

change_music(mus_intro);

// Menu
menuAlpha = 0;
menuOptions = ["Start", "Difficulty", "Modifiers", "Settings", /*"Credits",*/ "Exit"];
//Credits may want to be added later
menuSelected = 0;

// Line interaction
animDir = new Vector2(-1, 0);
spd = 1;
offsetPoint = new Vector2();

lineLength = 40

pointsDefault[0] = new Vector2(0, 0);
pointsDefault[1] = new Vector2(-lineLength, -lineLength);

points[0] = new Vector2();
points[0].x = pointsDefault[0].x;
points[0].y = pointsDefault[0].y;
points[1] = new Vector2();
points[1].x = pointsDefault[1].x;
points[1].y = pointsDefault[1].y;

lineRotation = -180;

menu = false

origin = new Vector2(room_width + lineLength/2, room_height/2 - lineLength/2);
offset = 0;
for (var i = 0; i < (room_width * 1.5) /(lineLength/2); i++;)
{
	line[i] = new Vector2();
	line[i].x = origin.x + animDir.x * i * lineLength/2;
	line[i].y = origin.y + animDir.y * i * lineLength/2;
}