

draw_reset()
draw_set_font(fnt_stats)

var hpWidth = string_width("HP 10/10 ")

var width = max(string_width(displayName + "LV " + string(global.love)) * 2, hpWidth * 2 + (global.maxHp * 1.2)) + 32

draw_set_color(c_white)

var corners =	[
					new Vector2(x, y),
					new Vector2(x + width, y),
					new Vector2(x, y + 100),
					new Vector2(x + width, y + 80),
				]



draw_triangle(corners[0].x, corners[0].y, corners[1].x, corners[1].y, corners[2].x, corners[2].y, false)
draw_triangle(corners[3].x, corners[3].y, corners[1].x, corners[1].y, corners[2].x, corners[2].y, false)

draw_set_color(c_black)
var border = 4
draw_triangle(corners[0].x + border, corners[0].y + border, corners[1].x - border, corners[1].y + border, corners[2].x + border, corners[2].y - border, false)
draw_triangle(corners[3].x - border, corners[3].y - border, corners[1].x - border, corners[1].y + border, corners[2].x + border, corners[2].y - border, false)

draw_set_color(c_white)
var textBorder = 12 + border
draw_text_transformed(corners[0].x + textBorder, corners[0].y + textBorder, displayName + "LV " + string(global.love), 2, 2, 0)
draw_text_transformed(corners[0].x + textBorder, corners[0].y + 24 + textBorder, "HP " + string(global.hp) + "/" + string(global.maxHp), 2, 2, 0)

draw_set_color(merge_color(c_red, c_maroon, 0.5))
var leftBorder = corners[0].x + textBorder + hpWidth * 2
draw_rectangle(leftBorder, y + 26 + textBorder, leftBorder + global.maxHp * 1.2, y + 45 + textBorder, false)

draw_set_color(c_yellow)
draw_rectangle(leftBorder, y + 26 + textBorder, leftBorder + global.hp * 1.2, y + 45 + textBorder, false)