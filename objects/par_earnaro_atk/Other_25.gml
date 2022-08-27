

if (!fading)
{
	fadeAnimation = instance_create_depth(0, 0, depth - 1000, obj_fade)
	fadeAnimation.image_blend = c_white
	fadeAnimation.image_alpha = 0
	fadeAnimation.alphaChange = 0.05
	fading = true
}