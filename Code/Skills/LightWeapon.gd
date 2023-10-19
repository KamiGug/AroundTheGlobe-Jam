class_name LightWeapon
extends Skill

var max_anim_time:float = 0.2
var current_anim_time:float

signal light_attack
signal light_attack_finished

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	lower_cd(_delta)
	if current_anim_time > 0:
		current_anim_time -= _delta
	else:
		light_attack_finished.emit()
	
func _use(direction:Vector2):
	if current_charges < 1:
		return
	light_attack.emit(direction.normalized())
	use_a_charge()
	current_anim_time = max_anim_time
	#enter weapon state with a direction

func _on_use_weapon_1(direction:Vector2):
	_use(direction)
	pass # Replace with function body.
