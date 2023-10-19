class_name DashState
extends State


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@warning_ignore("shadowed_variable")
func _enter(direction:Vector2):
	super(direction)
	statee.state_machine.travel("Dash")
	statee.animation_tree.set("parameters/Dash/blend_position", direction)
	has_to_finish = false
	can_finish = false
	statee.iframe_count += 1
	statee.collision_mask = statee.collision_mask - (1 + 8 + 16 + 64)
	#set_physics_mask.emit()
	#delete from mask passable enivironment mask from caster
	
func _exit():
	statee.collision_mask = statee.collision_mask + (1 + 8 + 16 + 64)
	super()
	#_animate(anim_tree,state_machine)
	#set_physics_mask.emit()
	#add to mask passable enivironment mask from caster
	pass	
	

#func _animate():
#	pass
	
func _on_dash_speed(speed:float):
	#set_velocity.emit(speed * direction)
	statee.velocity = speed * direction
	pass # Replace with function body.


func _on_dash_finished():
	has_to_finish = true
	can_finish = true
