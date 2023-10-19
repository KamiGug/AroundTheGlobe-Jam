class_name DamagedState
extends State

#var knockback_value: float
var knockback_time: float = 1.0/6.0
var curr_time:float

# Called when the node enters the scene tree for the first time.
@warning_ignore("shadowed_variable")
func _enter(knockback:Vector2):
	#knockback_value = direction.length()
	statee.velocity = knockback
	curr_time = knockback_time
	super(knockback.normalized())
	
	#need to add animations
	#statee.state_machine.travel("Knockback")
	#statee.animation_tree.set("parameters/Knockback/blend_position", self.direction)
	has_to_finish = false
	can_finish = false
	
	#
	statee.modulate = Color(1,0,0) #turn bright red
	
func _process(_delta):
	if curr_time > 0: 
		curr_time -= _delta
	else:
		has_to_finish = true
		can_finish = true
	
func _exit():
	statee.modulate = Color(1,1,1,1) #turn back from red
	#statee.collision_mask = statee.collision_mask + (1 + 8 + 16 + 64)
	super()
	
	#_animate(anim_tree,state_machine)
	#set_physics_mask.emit()
	#add to mask passable enivironment mask from caster
	pass	
	

#func _animate():
#	pass
	
