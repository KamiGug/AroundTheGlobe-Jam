extends Area2D


var inside = 0

const lines: Array[String] = [
	"amongus amongusas asd amongusssss",
]


func _on_body_entered(body: PhysicsBody2D):
	inside = 1


func _on_body_exited(body: PhysicsBody2D):
	inside = 0



func _process(delta):
	if inside == 1:
		if Input.is_action_just_pressed("ui_accept"):
			DialogManago.start_dialog(global_position, lines)
			globall.current_scene = 1


