class_name Dash
extends Skill

@export var dash_length: float = 200
@export var speed: float = 800
var travelled: float = 0
var iframe_count:int

#var i:int = 0
#var prev_finished:bool = true

signal dash_started
signal dash_finished
signal dash_speed
signal add_iframe

func _init():
	#max_cd = 7
	#max_charges = 3
	
	super()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	iframe_count = ceil(dash_length / (get_physics_process_delta_time() * speed))
	#set_process(false)
	set_physics_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	lower_cd(_delta)
	push_skill_state()
	
func _physics_process(delta):
	if dash_length > travelled + speed * delta:
		dash_speed.emit(speed)
		travelled += speed * delta
	else:
		dash_speed.emit((dash_length - travelled) / delta)
		#get_parent().velocity = direction_vector * (dash_length - travelled)
		die()
		pass
	pass

func die():
	dash_finished.emit()
	#set_process(false)
	set_physics_process(false)
	#prev_finished = true
	

func _use(_direction:Vector2):
	if current_charges < 1 :
		return
		
	#if !prev_finished:
	#	return
		
	set_process(true)
	set_physics_process(true)
	
	#prev_finished = true
	direction_vector = _direction.normalized()
	dash_started.emit(direction_vector)
	add_iframe.emit(iframe_count)
	use_a_charge()
	travelled = 0

#func animate():
	#caster.animation_tree.set("parameters/Dash/blend_position", direction_vector)
	#caster.state_machine.travel("Dash")
#	pass


func _on_use_skill_dash(direction:Vector2):
	_use(direction)
	
	
