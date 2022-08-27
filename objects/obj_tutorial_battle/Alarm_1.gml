var text;
for (var i = 0; i <= 8; i++;)
{
	text[i] = key_to_text("tutorial_end_spe_" + string(i))
}
blcon = instance_create_depth(earnaro.x + 30 * earnaro.image_xscale, earnaro.y - 172 * earnaro.image_yscale, earnaro.depth - 1, obj_blconwide);
blwrite = create_typer(blcon.x + 30 * blcon.image_xscale, blcon.y + 10 * blcon.image_yscale, earnaro.depth - 2, text);
endState++;