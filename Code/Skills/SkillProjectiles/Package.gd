class_name Package
extends Projectile

var length : float
var travelled : float = 0

#func _ready():
#	pass
	
func _process(_delta):
	#animate the box
	
	life_time = life_time - _delta
	if life_time < 0:
		die()
		return
	pass
	
func _physics_process(delta):
	if length > travelled + speed * delta: #direction_vector.length() is redundant 
		move_and_collide(direction * speed * delta)
		travelled = travelled + speed * delta
	else:
		move_and_collide((length-travelled) * direction)
		travelled = length
		#might add damage here
		#might turn of physics_process here
		
	#collisions here #if they are to be here
	

