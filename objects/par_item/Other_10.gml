/// @description Get Name
getName = function()
{
	if (global.inbattle)
	{
		if (global.serious)
		{
			return seriousName
		}
		else
		{
			return shortName
		}
	}
	else
	{
		return name;
	}
}

