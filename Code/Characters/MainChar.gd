extends Character
class_name MainChar

#get_local_mouse_position().normalized()

@export var starting_direction : Vector2 = Vector2(0, 1.0)
var input_direction : Vector2
var block_input: bool = false

#put skillhandler array with each skill

#@export var is_dodge_unlocked : bool = false
#@export var is_package_unlocked : bool = false
#@export var is_mallet_unlocked : bool = false

#weapons are the first 2 skills
#@export var skills_packed: Array[PackedScene]

var skills: Array[SkillHandler] = []

#@export var camera_path : NodePath #matters for reading mouse position #I think #it doesn't

func _init():
	speed = 180
	flag = "player"
	skills.resize(5)

func _ready():
	update_animation_tree(starting_direction)
	
	skills[0] = SkillHandler.new("res://Prefabs/Skills/Package.tscn", 5, 1)
	skills[1] = SkillHandler.new("res://Prefabs/Skills/Dash.tscn", 7, 3)
	
	
	

#func _input(event): #use to call on skills #should make it easy #will need to lock in anim i think
#	print(event)
#	match event.keycode:
#		1: #find dictionary: keycode => inputmap_name  
#			print(event)
#		"weapon2":
#			print("weapon2")


func _process(_delta):
	
	#call animation functions
	if !block_input:
		update_animation_tree(velocity)
		pick_new_state(velocity)
	
	#kinda hacky but it works
	for skill in skills:
		if typeof(skill)!= TYPE_NIL:
			skill._process(_delta)
		pass

func _physics_process(_delta):
	#kinda hacky but it works
	for skill in skills:
		if typeof(skill) != TYPE_NIL:
			skill._process(_delta)
		pass
	
	if !block_input: 
		if Input.is_action_just_pressed("Package") && skills.size()>0:
			skills[0]._use(get_local_mouse_position(), self, get_top_node())
			
			
		if Input.is_action_just_pressed("Dash"):
			skills[1]._use(get_local_mouse_position(), self, get_top_node())

		#read input for movement
		input_direction = get_input_vector()
		velocity = lerp(velocity, input_direction * speed, 0.4)
	
	move_and_slide()
	#for n in range(0, get_slide_collision_count() - 1):
	#	handle_collision(get_slide_collision(n))
		
	if iframe_count > 0:
		iframe_count = iframe_count - 1
	
func get_input_vector():
	var tmp = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	
	if tmp != Vector2.ZERO: 
		tmp = tmp.normalized()
	return tmp
	
func get_top_node():
	return get_tree().get_root().get_child(0);
	
#func handle_collision(collision : KinematicCollision2D):
#	print(collision.id)
#	match collision.get_collider().get_flag():
#		"player":
#			pass
#		"enemy":
#			pass
	
func update_animation_tree(direction):
	if direction.length() > 0.1:
		direction = direction.normalized()
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		
func pick_new_state(direction):
	if direction.length() > 0.7:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")


