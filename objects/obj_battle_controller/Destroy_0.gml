

for (var i = 0; i < array_length(buttons); i++;)
{
	instance_destroy(buttons[i].instance);
}
instance_destroy(bb);
instance_destroy(soul);
instance_destroy(healthBar)