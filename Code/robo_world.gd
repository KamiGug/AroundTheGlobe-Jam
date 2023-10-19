extends Node2D


func _process(delta):
	change_scenes()


func _on_back_to_office_body_entered(body):
	if body.has_method("player"):
		globall.transition = true


func _on_back_to_office_body_exited(body):
	if body.has_method("player"):
		globall.transition = false
		

func change_scenes():
	if globall.transition == true:
		if globall.current_scene == 2:
			get_tree().change_scene_to_file("res://Levels/world_3.tscn")
			globall.finish_changescenes()
		else:
			return





