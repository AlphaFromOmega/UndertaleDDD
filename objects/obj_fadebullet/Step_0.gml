

if (!created)
{
	t = fadeTime;
	created = true;
}
t--;
image_alpha = t/fadeTime

image_xscale *= 1 - 1/fadeTime
image_yscale *= 1 - 1/fadeTime

if (image_alpha < 0.5)
{
	canCollide = false
	if (t == 0)
	{
		instance_destroy()
	}
}
