

size = new Vector2((room_width * 12 / 16) - 64, room_height - 64);
created = false

descriptionScale = 2.5
descriptionTyper = new TextProperties(fnt_main, c_white, x + size.x * 0.7/descriptionScale, 0, 1, noone, new Vector2(8 * descriptionScale, 16 * descriptionScale), new Vector2(descriptionScale, descriptionScale))

quoteScale = 2
quoteTyper = new TextProperties(fnt_main, $AAAAAA, x + size.x * 0.7/quoteScale, 0, 1, noone, new Vector2(8 * quoteScale, 16 * quoteScale), new Vector2(quoteScale, quoteScale))

selected = 0

menuOptions = ["Play", "Exit"]
fade = 0;