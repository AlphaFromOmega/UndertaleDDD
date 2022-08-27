/// @description Get Use Text
getUse = function()
{
	state = 1;
	if (global.serious && global.inbattle)
	{
		return seriousUseText
	}
	else
	{
		return useText
	}
}