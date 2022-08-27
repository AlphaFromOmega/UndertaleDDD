/// @description ?
outline_init()
level = new Levels("tutorial", key_to_text("tutorialstart_levelname"), noone, key_to_text("tutorialstart_leveldescription"), key_to_text("tutorialstart_levelquote"), 1);
corners = [
	new Vector2(96, room_height/3),
	new Vector2(0, room_height/2),
	new Vector2(96, room_height * 2/3),
	new Vector2(room_width/4 - 96, room_height/3),
	new Vector2(room_width/4, room_height/2),
	new Vector2(room_width/4 - 96, room_height * 2/3)
]

outline = surface_create(room_width, room_height);

alphaDelta = 0.05
alpha = alphaDelta;
