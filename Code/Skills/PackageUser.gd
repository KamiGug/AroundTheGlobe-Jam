extends Skill

var root: Node2D
@export var max_length: float = 150
@export var speed : float = 250
const START_DIST: float = 10
var package_prefab: PackedScene;

func _init():
	#max_cd = 5
	#max_charges = 1
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#speed = length / (get_physics_process_delta_time() * frame_count)
	super()
	root = get_window().get_child(0)
	package_prefab = preload("res://Prefabs/Skills/SkillProjectiles/Package.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	lower_cd(_delta)
	pass

func _use(_direction:Vector2):
	if current_charges < 1:
		return
	var instance = package_prefab.instantiate()
	root.add_child(instance)
	if _direction.length() > max_length:
		instance.set_movement(_direction.normalized(), speed, max_length)
	else:
		instance.set_movement(_direction.normalized(), speed, _direction.length())
	pass
	instance.position = instance.direction * START_DIST + get_parent().global_transform.origin
	instance.travelled = START_DIST
	use_a_charge()

func _on_use_skill_package(direction:Vector2):
	_use(direction)
	pass # Replace with function body.
