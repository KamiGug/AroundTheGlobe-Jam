extends Node2D

func _ready():
	if globall.game_first_loadin == true:
		$MainChar.position.x = globall.player_start_pos_x
		$MainChar.position.y = globall.player_start_pos_y
	else:
		$MainChar.position.x = globall.player_exit_office_pos_x
		$MainChar.position.y = globall.player_exit_office_pos_y

func _process(delta):
	change_scene()
	

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		globall.transition = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		globall.transition = false


func change_scene():
	if globall.transition == true:
		if globall.current_scene == 1:
			get_tree().change_scene_to_file("res://Levels/World2.tscn")
			globall.game_first_loadin = false
			globall.current_scene = 2
			globall.finish_changescenes()
