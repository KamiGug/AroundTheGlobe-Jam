class_name Dash
extends Skill

var dash_length: float = 250;
var speed: float = 800;
var travelled: float = 0;
var caster;

# Called when the node enters the scene tree for the first time.
func _ready():
	caster = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animate()
	pass
	
func _physics_process(delta):
	if dash_length > travelled + speed * delta:
		caster.velocity = direction_vector * speed
		caster.iframe_count = caster.iframe_count + 1
		travelled = travelled + speed * delta
	else:
		caster.velocity = direction_vector * (dash_length - travelled)/delta
		die()
	pass

func die():
	get_parent().block_input = false
	caster.state_machine.travel("Idle")
	super()
	

static func _use(_direction:Vector2, _caller: Node2D, _root: Node2D = null, _prefab: PackedScene = null):
	var instance = _prefab.instantiate()
	instance.direction_vector = _direction.normalized()
	_caller.add_child(instance)
	instance.global_position = _caller.global_position
	_caller.block_input = true
	
	#set anims
	
	
	
	return instance

func animate():
	caster.animation_tree.set("parameters/Dash/blend_position", direction_vector)
	caster.state_machine.travel("Dash")
	pass
