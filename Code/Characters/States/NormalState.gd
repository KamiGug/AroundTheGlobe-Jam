class_name NormalState
extends State

#var direction:Vector2
@export var speed:float = 160
var velocity = Vector2.ZERO

func _init():
	super()
	can_finish = true
	has_to_finish = false
	
# Called when the node enters the scene tree for the first time.

func _process(_delta):
	#direction = get_input_vector()
	statee.direction = get_input_vector()
	pass

func _physics_process(_delta):
	_set_velocity()
	#statee.velocity = velocity
	#set_velocity.emit(velocity)

@warning_ignore("shadowed_variable")
func _enter(direction:Vector2):
	super(direction)
	#self.direction = direction
	#_animate(anim_tree, state_machine)
	
	
func _exit():
	super()
	pass

func _animate():
	if statee.velocity.length() > 0.7:
		statee.state_machine.travel("Walk")
		#direction = direction.normalized()
		statee.animation_tree.set("parameters/Idle/blend_position", statee.velocity.normalized())
		statee.animation_tree.set("parameters/Walk/blend_position", statee.velocity.normalized())
	else:
		statee.state_machine.travel("Idle")
			
func get_input_vector():
	var tmp = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	if tmp != Vector2.ZERO: 
		tmp = tmp.normalized()
	return tmp
	
func _set_velocity():
	statee.velocity = lerp(statee.velocity, statee.direction.normalized() * speed, 0.4)

#@warning_ignore("shadowed_variable")
#func _on_update_direction(direction:Vector2):
#	self.direction = statee.direction


