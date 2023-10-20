extends State


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(_delta):
	if statee.iframe_count > 0:
		statee.iframe_count -= 1
		
func _enter(direction:Vector2):
	super(direction)
	statee.state_machine.travel("Idle")
	statee.animation_tree.set("parameters/Walk/blend_position", statee.velocity.normalized())
	statee.velocity = Vector2.ZERO
	
	#self.direction = direction
	#_animate(anim_tree, state_machine)
		
func _exit():
	super()
	pass
	
func _animate():
	pass
