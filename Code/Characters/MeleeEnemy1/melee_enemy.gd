extends Character

@export var self_knockback: float = 10

func _physics_process(delta):
	move_and_slide()


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
