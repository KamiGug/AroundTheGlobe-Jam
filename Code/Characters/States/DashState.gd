class_name DashState
extends State


# Called when the node enters the scene tree for the first time.

func _init():
	pass

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@warning_ignore("shadowed_variable")
func _enter(anim_tree: AnimationTree, state_machine, direction:Vector2):
	super(anim_tree,state_machine,direction)
	state_machine.travel("Dash")
	anim_tree.set("parameters/Dash/blend_position", direction)
	has_to_finish = false
	can_finish = false
	
func _exit(anim_tree: AnimationTree, state_machine):
	super(anim_tree,state_machine)
	_animate(anim_tree,state_machine)
	pass	
	
@warning_ignore("unused_parameter", "shadowed_variable")
func _animate(anim_tree: AnimationTree, state_machine):
	pass
	
func _on_dash_speed(speed:float):
	set_velocity.emit(speed * direction)
	pass # Replace with function body.


func _on_dash_finished():
	has_to_finish = true
	can_finish = true
	pass # Replace with function body.
