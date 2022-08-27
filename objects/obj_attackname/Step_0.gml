

image_alpha += fade
if (image_alpha >= 1)
{
	fade = 0
}
if (image_alpha <= 0)
{
	instance_destroy()
}