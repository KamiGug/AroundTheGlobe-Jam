class_name NormalState
extends State

#var direction:Vector2
@export var speed:float = 160
#var velocity = Vector2.ZERO

signal use_skill_dash
signal use_skill_package
signal use_weapon_1
signal use_weapon_2
signal use_skill_block
signal end_skill_block

func _init():
	super()
	can_finish = true
	has_to_finish = false
	
# Called when the node enters the scene tree for the first time.

func _process(_delta):
	if Input.is_action_just_pressed("Package"):
		use_skill_package.emit(get_local_mouse_position())
			
	if Input.is_action_just_pressed("Dash"):
		use_skill_dash.emit(get_local_mouse_position())
		
	#if Input.is_action_just_pressed("Block"):
	#	use_skill_block.emit(get_local_mouse_position())
		
	if Input.is_action_just_released("Block"):
		end_skill_block.emit()
		
	if Input.is_action_just_pressed("Weapon1"):
		use_weapon_1.emit(get_local_mouse_position())
		
	if Input.is_action_just_pressed("Weapon2"):
		use_weapon_2.emit(get_local_mouse_position())
	#direction = get_input_vector()
	statee.direction = get_input_vector()
	pass

func _physics_process(_delta):
	_set_velocity()
	if statee.iframe_count > 0:
		statee.iframe_count -= 1
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


