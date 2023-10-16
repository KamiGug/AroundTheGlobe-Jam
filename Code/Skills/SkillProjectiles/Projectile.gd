class_name Projectile
extends StaticBody2D

var speed : float = 500
@export var life_time: float = 15
var direction: Vector2

var animation_tree = null
var state_machine = null

# Called when the node enters the scene tree for the first time.
func _ready():
	#animation_tree = $AnimationTree
	#if typeof(animation_tree) != TYPE_NIL:
	#	print(animation_tree)
	#	state_machine = animation_tree.get("parameters/playback")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

@warning_ignore("shadowed_variable")
func set_movement(direction: Vector2 = Vector2.ZERO, speed: float = 0, length: float = 0):
	self.direction = direction
	self.speed = speed
	self.length = length
	
func _animate():
	pass
	

func die():
	get_parent().remove_child(self)
	self.queue_free()
