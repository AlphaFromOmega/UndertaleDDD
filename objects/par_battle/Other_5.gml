/// @description ?
time_source_destroy(ts);
window_set_caption("UNDERTALE DDD");
if (!is_undefined(global.gameStats[? levelid]))
{
	global.gameStats[? levelid].wins++;
	if (global.gameStats[? levelid].difficultyWin[global.difficulty] < 2)
	{
		global.gameStats[? levelid].difficultyWin[global.difficulty] = 1;
	}
	if (noHit)
	{
		global.gameStats[? levelid].difficultyWin[global.difficulty] = 2;
	}
}