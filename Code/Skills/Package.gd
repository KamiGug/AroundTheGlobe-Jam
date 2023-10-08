class_name Package
extends Skill

var max_length: float = 150
var length : float
var speed : float = 250
var travelled : float = 0
var life_time: float = 15
const START_DIST: float = 7



func _init():
	#direction_vector = direction
	#max_cd = 3
	pass

#func _draw():
#	draw_line(Vector2.ZERO, Vector2(-300,0), Color(1,0,0,0.05), 30)

func _ready():
	#speed = length / (get_physics_process_delta_time() * frame_count)
	if direction_vector.length() < max_length:
		length = direction_vector.length()
	else:
		length = max_length
	direction_vector = direction_vector.normalized()
	
func _process(delta):
	#animations here
	
	
	life_time = life_time - delta
	if life_time < 0:
		die()
		return
	pass
	
func _physics_process(delta):
	if length > travelled + speed * delta: #direction_vector.length() is redundant 
		move_and_collide(direction_vector * speed * delta)
		travelled = travelled + speed * delta
	else:
		move_and_collide((length-travelled) * direction_vector)
		travelled = length

	#collisions here #if they are to be here
	

static func _use(direction:Vector2, caller: Node2D, root: Node2D = null, prefab: PackedScene = null): #consider direction normalized
	#add to root scene #it's gonna be somewhat hard
	var instance: Node2D = prefab.instantiate()
	instance.direction_vector = direction
	root.add_child(instance)
	instance.global_transform.origin = caller.global_position + direction.normalized() * START_DIST
	#instance.owner = root
	return instance
	#basic setup
	

