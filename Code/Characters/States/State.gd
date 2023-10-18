class_name State
extends Node2D

var interruptable:bool = false
@export var state_speed:float
var can_finish:bool = true
var has_to_finish:bool = false
var direction:Vector2

signal set_velocity

# Called when the node enters the scene tree for the first time.
func _init():
	set_process(false)
	set_physics_process(false)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@warning_ignore("unused_parameter", "shadowed_variable")
func _enter(anim_tree: AnimationTree, state_machine, direction:Vector2):
	set_process(true)
	set_physics_process(true)
	self.direction = direction
	pass
	
@warning_ignore("unused_parameter")
func _exit(anim_tree: AnimationTree, state_machine):
	set_process(false)
	set_physics_process(false)
	pass

@warning_ignore("unused_parameter", "shadowed_variable")
func _animate(anim_tree: AnimationTree, state_machine):
	pass

@warning_ignore("unused_parameter")
func _move(velocity:Vector2):
	pass


