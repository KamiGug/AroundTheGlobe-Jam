class_name Skill
extends StaticBody2D

@export var max_cd: float = 7
var current_cd: float = 0
@export var max_charges:int = 1
var current_charges:int 

#signal skill_state

var direction_vector: Vector2

#@onready var animation_tree = $AnimationTree #get animation tree #all characters will have one of those
#@onready var state_machine = animation_tree.get("parameters/playback") #that is the thing that determines the states

func _init():
	
	pass

func _ready():
	current_charges = max_charges
	#current_charges = max_charges
	pass

func _process(_delta):	
	#animations here	
	
	#current_cd = current_cd - delta
	pass

func _physics_process(_delta):
	
	#collisions here
	pass

func _use(_direction:Vector2): #consider direction normalized
	pass
	
	
	#direction_vector = direction
	#root.add_child(Skill.new(direction))
	
func can_use():
	if current_charges > 0:
		return true
	else:
		return false
			
func die():
	#get_parent().remove_child(self)
	#self.queue_free()
	pass

func use_a_charge():
	current_charges -= 1
	if current_cd <= 0:
		current_cd = max_cd

func lower_cd(_delta: float):
	if current_cd > 0:
		current_cd = current_cd - _delta
		if current_cd <=0 && current_charges < max_charges :
			current_charges += 1
			if current_charges < max_charges:
				current_cd = max_cd + current_cd #time that was over what was necessary is accounted for #no loss of time here xD
	
#func push_skill_state():
#	skill_state.emit(current_cd, current_charges)
