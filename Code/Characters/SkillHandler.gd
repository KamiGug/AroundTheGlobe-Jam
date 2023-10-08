class_name SkillHandler
extends Node

var current_charges:int
var max_charges:int
var current_cd:float = 0
var max_cd:float
var prefab: PackedScene
var skill: GDScript
var instances: Array[Node2D]


# Called when the node enters the scene tree for the first time.

@warning_ignore("shadowed_variable")
func _init(prefab: String, _max_cd: float = 5, _max_charges: int = 2):#, max_cd:float = 7, max_charges:int = 1):
	max_cd = _max_cd
	max_charges = _max_charges
	current_charges = max_charges
	self.prefab = load(prefab)
	var state = self.prefab.get_state()
	for n in range(0, state.get_node_property_count(0)):
		if state.get_node_property_name(0, n) == "script":
			skill = state.get_node_property_value(0, n)
			break
	
	
	#self.max_cd = max_cd;
	#self.max_charges = max_charges;

func _use(direction:Vector2, caller: Node2D, root: Node2D):
	if  current_charges == 0:
		return
	#might need to do some more here	
	#skill = prefab.instantiate()
	#get_tree().get_root().get_child(0).add_child(skill)
	var tmp = skill._use(direction, caller, root, prefab)
	if typeof(tmp) != TYPE_NIL:
		instances.append(tmp)
	
	current_charges = current_charges - 1
	if current_cd <= 0:
		current_cd = max_cd
	pass;

func _ready():
	pass; 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #dunno why is it not called on it's own #might have to do that it's not a node i guess
	#for instance in instances:
	#	instance._process(delta)
	if current_cd > 0:
		current_cd = current_cd - _delta
		if current_cd <= 0:
			current_charges = current_charges + 1
			if current_charges < max_charges:
				current_cd = max_cd
	pass
	
func _physics_process(_delta):
	#for instance in instances:
	#	instance._physics_process(delta)
	pass

func can_use():
	if current_charges > 0:
		return true
