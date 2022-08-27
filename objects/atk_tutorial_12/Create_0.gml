

event_inherited();

bb.boxPosDest = new Vector2(room_width/2, room_height * 3/4);
bb.boxScaleDest = new Vector2(room_width * 0.75, room_height/6);

var lines = 2

net = instance_create_depth(bb.x, bb.y, bb.depth - 1, obj_net);

net.lines = lines
soul.mode = SOUL_MODE.MAGENTA;
soul.netPos = ceil(lines/2) - 1

shotsFired = 0;

dir = 0

phase = 0
target = 115
oDir = 0
curvePostion = 0
laserSpeed = 0