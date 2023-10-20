extends State

@export var speed: float = 100
@export var max_time: float = 1.0
var boredom_counter: float
var current_speed: float
static var RNG = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _init():
	super()

func _ready():
	super() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta):
	if boredom_counter > 0:
		boredom_counter -= _delta
	else:
		boredom_counter = max_time
		_choose_speed()
		_choose_direction()
		
	_set_velocity()
	

func _physics_process(_delta):
	_set_velocity()
	if statee.iframe_count > 0:
		statee.iframe_count -= 1
	#statee.velocity = velocity
	#set_velocity.emit(velocity)

@warning_ignore("shadowed_variable")
func _enter(direction:Vector2):
	_choose_speed()
	_choose_direction()
	super(self.direction)
	boredom_counter = max_time
	
	
	#current_speed = RNG.
	#self.direction = direction
	#_animate(anim_tree, state_machine)
	
	
func _exit():
	super()
	pass

func _animate():
	if statee.velocity.length() > 0.7:
		statee.state_machine.travel("Walk")
		#direction = direction.normalized()
		statee.animation_tree.set("parameters/Idle/blend_position", statee.velocity.normalized())
		statee.animation_tree.set("parameters/Walk/blend_position", statee.velocity.normalized())
	else:
		statee.state_machine.travel("Idle")

func _set_velocity():
	statee.velocity = lerp(statee.velocity, direction.normalized() * current_speed, 0.4)

func _choose_speed():
	if RNG.randi() % 2 == 0:
		current_speed = 0
	else:
		current_speed = RNG.randf_range(speed/2, speed)
		
func _choose_direction():
	direction = Vector2(RNG.randf_range(-1.0, 1.0), RNG.randf_range(-1.0, 1.0)).normalized()
