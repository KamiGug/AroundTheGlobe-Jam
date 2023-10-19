extends Node

#self explanatory
var current_scene = 0

#are we transitioning through worlds?
var transition = false

var player_exit_office_pos_y = -44
var player_exit_office_pos_x = 56

var player_start_pos_x = 0
var player_start_pos_y = 0

var game_first_loadin = true

func finish_changescenes():
	if transition == true:
		transition == false
		current_scene = 0
	

