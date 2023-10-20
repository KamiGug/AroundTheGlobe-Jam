class_name StateMachine
extends Node2D

#var states: Array[State]
var states: Dictionary
var current_state: State = null
var main_state_name: String

#@export var animation_tree:AnimationTree #get animation tree #all characters will have one of those
#var state_machine #that is the thing that determines the states


# Called when the node enters the scene tree for the first time.
func _ready():
	#states.resize(get_child_count())
	for state in get_children():
		if typeof(state) == typeof(State): 
			#states.append(state)
			states[state.name] = state
			if current_state == null:
				current_state = state
				main_state_name = current_state.name
			else:
				state.set_process(false)
				state.set_physics_process(false)
		
	#if typeof(animation_tree) != TYPE_NIL:	
	#	state_machine = animation_tree.get("parameters/playback")
	#else:
	#	print("No animation tree connected!")
	#	print("Parent: ", get_parent().name)
	
	if typeof(get_parent().animation_tree) == TYPE_NIL:	
		print("No animation tree connected!")
		print("Parent: ", get_parent().name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	current_state._animate()
	if current_state.has_to_finish:
		_set_current(states[main_state_name], get_parent().direction)

@warning_ignore("unused_parameter")
func _physics_process(delta):
	#get_parent().velocity = current_state._set_velocity(get_parent().velocity, get_parent().direction, get_parent().speed)
	#current_state._move(get_parent().velocity)
	pass

func _set_current(state:State, direction:Vector2):
	if current_state.can_finish:
		current_state._exit()#get_parent())
		state._enter(direction)
		current_state = state
	#pass

func _on_dash_started(direction:Vector2):
	_set_current(states["DashState"], direction)
	pass # Replace with function body.


func _on_light_attack(direction:Vector2):
	_set_current(states["LightWeaponState"], direction)


func _on_heavy_attack(direction:Vector2):
	_set_current(states["HeavyWeaponState"], direction)

func _on_knocked_back(knockback_vector:Vector2):
	_set_current(states["DamagedState"],knockback_vector)


func _on_weapon_collision_body_entered(body):
	if current_state.has_method("deal_damage"):
		current_state.deal_damage(body, body.position - get_parent().position)
	else:
		print("on weapon collision no 'deal damage' method! current state: ", current_state.name)
	pass # Replace with function body.
