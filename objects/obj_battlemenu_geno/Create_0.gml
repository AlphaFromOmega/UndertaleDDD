

if (controllable)
{
	change_music(mus_selection)
}
outline_init()
levels =	[
				new Levels("tutorial", key_to_text("tutorial_levelname"), noone, key_to_text("tutorial_leveldescription"), key_to_text("tutorial_levelquote"), 1),
				new Levels("genotoriel", key_to_text("genotoriel_levelname"), noone, key_to_text("genotoriel_leveldescription"), key_to_text("genotoriel_levelquote"), 1),
			]



offset = 0;
menuSelected = 0;

corners = [
	new Vector2(96, room_height/3),
	new Vector2(0, room_height/2),
	new Vector2(96, room_height * 2/3),
	new Vector2(room_width/4 - 96, room_height/3),
	new Vector2(room_width/4, room_height/2),
	new Vector2(room_width/4 - 96, room_height * 2/3)
]

outline = surface_create(room_width, room_height)