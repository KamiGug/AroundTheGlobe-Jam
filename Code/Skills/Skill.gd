class_name Skill
extends StaticBody2D

#static var max_cd: float = 7
#static var current_cd: float = 0
@export var direction_vector: Vector2

#@onready var animation_tree = $AnimationTree #get animation tree #all characters will have one of those
#@onready var state_machine = animation_tree.get("parameters/playback") #that is the thing that determines the states

func _init():
	pass

func _ready():
	pass

func _process(_delta):
	#animations here	
	
	#current_cd = current_cd - delta
	pass

func _physics_process(_delta):
	
	#collisions here
	pass

static func _use(_direction:Vector2, _caller: Node2D, _root: Node2D = null, _prefab: PackedScene = null): #consider direction normalized
	return null;
	#direction_vector = direction
	#need a constructor with direction parameter and then add it to the root scene (level)
	#root.add_child(Skill.new(direction))
	
func die():
	get_parent().remove_child(self)
	self.queue_free()
