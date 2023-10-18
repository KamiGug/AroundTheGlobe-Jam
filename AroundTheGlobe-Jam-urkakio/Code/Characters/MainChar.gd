extends CharacterBody2D

@export var speed : float = 300;
@export var starting_direction : Vector2 = Vector2(0, 1.0)

@export var is_dodge_unlocked : bool = false
@export var is_package_unlocked : bool = false
@export var is_mallet_unlocked : bool = false


@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_tree(starting_direction)

func _physics_process(delta):
	#read input for movement
	var input_direction = set_input_vector();
		
	velocity = lerp(velocity, input_direction * speed, 0.4)
	
	#call animation functions
	update_animation_tree(velocity)
	pick_new_state(velocity)
	
	move_and_slide()
	
	
func set_input_vector():
	var tmp = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	
	if tmp != Vector2.ZERO: 
		tmp = tmp.normalized()
	return tmp
	
	
func update_animation_tree(direction):
	if direction.length() > 0.1:
		direction = direction.normalized()
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		
func pick_new_state(direction):
	if direction.length() > 0.1:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")

func player():
	pass
	


