class_name State
extends Node2D

#var interruptable:bool = false
@export var state_speed:float
var can_finish:bool = true
var has_to_finish:bool = false
var direction:Vector2
var statee:Node2D

#signal set_velocity
#signal set_physics_layer
#signal set_physics_mask

# Called when the node enters the scene tree for the first time.
func _init():
	set_process(false)
	set_physics_process(false)

func _ready():
	statee = get_parent().get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@warning_ignore("shadowed_variable")
func _enter(direction:Vector2):
	set_process(true)
	set_physics_process(true)
	self.direction = direction
	pass
	

func _exit():
	set_process(false)
	set_physics_process(false)
	pass

func _animate():
	pass

func _move():
	pass


