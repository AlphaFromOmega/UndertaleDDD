

boxScale = new Vector2(room_width * 0.75, room_height / 4);
boxScaleDest = new Vector2(room_width * 0.75, room_height / 4);
scaleGrad = 0.1;

boxPosDest = new Vector2(x, y)
posGrad = 0.1;

boxAngle = 0;
battlebox = sprite_duplicate(sprite_index);
sprite_set_offset(battlebox, sprite_get_width(sprite_index)/2, sprite_get_height(sprite_index)/2);

for (var i = 0; i < 4; i++;)
{
	collider[i] = instance_create_depth(room_width/2, room_height/2, depth - 100,obj_bbcollider);
}
modify_box_collision();

mask_index = empty;

mask = surface_create(room_width, room_height);
surface_set_target(mask);
draw_clear_alpha(c_white, 0);
var xh = sprite_get_width(sprite_index)/3;
var yh = sprite_get_height(sprite_index)/3;
draw_sprite_ext(pixel, 0, x + xh - boxScale.x/2, y + yh - boxScale.y/2, boxScale.x - (xh * 2), boxScale.y - (yh * 2), boxAngle, c_white, 1);
surface_reset_target();