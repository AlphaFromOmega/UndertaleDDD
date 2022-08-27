enum DIFFICULTY
{
	EASY,
	NORMAL,
	HARD,
	LUNATIC
}


function BattleStats() constructor
{
	wins = 0;
	losses = 0;
	shortestTime = 0;
	difficultyWin = [0, 0, 0, 0];
}