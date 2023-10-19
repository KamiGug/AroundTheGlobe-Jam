extends Character
class_name MainChar

#get_local_mouse_position().normalized()


@export var starting_direction : Vector2 = Vector2(0, 1.0)


#skill signals


#signal update_direction

func _init():
#	speed = 180
	pass

func _ready():
	pass
	
#func _process(_delta):
	#iframe_count = 1
	#if iframe_count > 0:
	#	$Sprite2D.self_modulate  = Color("FFD700", 0.5)
	#else:
	#	$Sprite2D.self_modulate  = Color("FFFFFF", 1)
		#read input for movement
	#update_direction.emit(get_input_vector())
	#if !block_input:
	#update_animation_tree(velocity)
	#pick_new_state(velocity)
	#kinda hacky but it works
	#for skill in skills:
	#	if typeof(skill)!= TYPE_NIL:
	#		skill._process(_delta)

func _physics_process(_delta):
	move_and_slide()
	
	#if iframe_count > 0:
	#	iframe_count = iframe_count - 1
	
#func get_input_vector():
#	var tmp = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
#	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
#	if tmp != Vector2.ZERO: 
#		tmp = tmp.normalized()
#	return tmp
	

func _on_add_iframe(count:int):
	iframe_count += count

#@warning_ignore("shadowed_variable", "shadowed_variable_base_class")
#func _on_normal_state_set_velocity(velocity:Vector2):
#	self.velocity = velocity
#	pass # Replace with function body.

#@warning_ignore("shadowed_variable", "shadowed_variable_base_class")
#func _on_dash_state_set_velocity(velocity:Vector2):
#	self.velocity = velocity
#	pass # Replace with function body.
