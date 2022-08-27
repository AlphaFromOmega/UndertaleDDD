
smallBullets = (global.difficulty * 8) + 24
largeBullets = (global.difficulty + 1) * 8


// Inherit the parent event
event_inherited();
soul.mode = 0;
bb.boxScaleDest = new Vector2(room_height/3, room_height/4);
shots_fired = 0;