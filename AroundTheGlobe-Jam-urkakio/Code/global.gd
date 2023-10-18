extends Node

#self explanatory
var current_scene = 1
var gatekeep = 0
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
	#if current_scene == 1:
	#	current_scene = 2
	#elif current_scene == 2:
	#	current_scene = 3
	#else:
	#	current_scene = 3
	

