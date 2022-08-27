/// @description ?
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var k = 1;
for (var j = 0; j < 4; j++)
{
	for (var i = 0; i < 7; i++)
	{
		total_case[i][j] = string_copy(string_upper(alphabet),k,1);
		total_case[i][j + 4] = string_copy(string_lower(alphabet),k,1);
		k++;
	}
}
done = false;
player_name = "";
text = "Is this name correct?";
changeable = true;
allowed = true;

bottom_options = ["Clear", "Backspace", "Done"];
bottom_x = [4/16, 4/8, 12/16];

cursor_x = 0;
cursor_y = 0;

cursor_bottom = 0;

changing_scene = false;
alpha = 0;

lrp = 0;
obj_global.destRoom = room
save_game(); // Force the user to start in the name room after completing the tutorial