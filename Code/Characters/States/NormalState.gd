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

func _physics_process(_delta):
	_set_velocity()
	set_velocity.emit(velocity)

@warning_ignore("shadowed_variable")
func _enter(anim_tree: AnimationTree, state_machine, direction:Vector2):
	super(anim_tree,state_machine,direction)
	self.direction = direction
	_animate(anim_tree, state_machine)
	
	
@warning_ignore("shadowed_variable")
func _exit(anim_tree: AnimationTree, state_machine):
	super(anim_tree,state_machine)
	pass

@warning_ignore("shadowed_variable", "unused_parameter")
func _animate(anim_tree: AnimationTree, state_machine):
	if velocity.length() > 0.7:
		state_machine.travel("Walk")
		#direction = direction.normalized()
		anim_tree.set("parameters/Idle/blend_position", velocity.normalized())
		anim_tree.set("parameters/Walk/blend_position", velocity.normalized())
	else:
		state_machine.travel("Idle")
			
	
@warning_ignore("shadowed_variable")
func _set_velocity():
	velocity = lerp(velocity, direction.normalized() * speed, 0.4)


@warning_ignore("shadowed_variable")
func _on_update_direction(direction:Vector2):
	self.direction = direction
	pass # Replace with function body.
