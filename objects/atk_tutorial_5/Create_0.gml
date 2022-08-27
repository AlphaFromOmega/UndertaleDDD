

event_inherited();

bb.boxScaleDest = new Vector2(room_height/3, room_height/4);

var lines = 3

net = instance_create_depth(bb.x, bb.y, bb.depth - 1, obj_net);

net.lines = lines
soul.mode = 3;
soul.netPos = ceil(lines/2) - 1

bg.bgColour = 5;
bullets = 0;