

if (fading)
{
	if (instance_exists(fadeAnimation) && fadeAnimation.image_alpha >= 1)
	{
		fadeAnimation.alphaChange = -0.05
		instance_destroy()
	}
}