class_name Block
extends Skill

@export_range (0,1) var mitigation: float = 0.75
@export_range (0, 20) var offset: float = 7
@export var rotation_center_offset: Vector2 = Vector2(0,5)
var shield_prefab: PackedScene
var instance: Shield
@export var caster: Character

var i:int = 0
var j:int = 0
	
func _init():
	max_charges = 1
	max_cd = 0.5
	super()

# Called when the node enters the scene tree for the first time.
func _ready():
	shield_prefab = preload("res://Prefabs/Skills/SkillProjectiles/Shield.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lower_cd(delta)
	pass

func _use(_direction: Vector2):
	if current_charges > 0:
		current_charges -= 1
		if typeof(instance) == TYPE_NIL:
			instance = shield_prefab.instantiate()
			instance.direction = _direction
			instance.offset = offset
			instance.caster = caster
			caster.add_child(instance)
			
	
	
	
	
func _release():
	if typeof(instance) != TYPE_NIL:
		instance.die()
		instance = null
		#instance = null
		current_cd = max_cd
	pass
	

func _on_use_skill_block(_direction: Vector2):
	if current_charges > 0:
		_use(_direction)
	pass # Replace with function body.


func _on_end_skill_block():
	_release()
	pass # Replace with function body.
