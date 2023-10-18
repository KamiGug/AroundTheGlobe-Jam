extends CharacterBody2D
class_name Character

@export var speed = 160
var flag = null #use a string like "player", "enemy", "npc", "destructible"
var iframe_count : int = 0 #important to all characters to have iframes (or they'd die 2 fast)
var max_health : int = 3000
var health : int = max_health
var iframes_after_damage = 3
var direction:Vector2

@onready var animation_tree = $AnimationTree #get animation tree #all characters will have one of those
@onready var state_machine = animation_tree.get("parameters/playback") #that is the thing that determines the states

func _init():
	pass

func _ready():
	pass

func _process(_delta):
	#animations here	
	pass

func _physics_process(_delta):
	
	#collisions here
	
	if iframe_count > 0:
		iframe_count = iframe_count - 1
	
	
func set_input_vector():
	#part of AI here - pathing
	pass
	
func get_flag():
	return flag
	
func handle_collision(collision : KinematicCollision2D):
	print(collision.id)
	
	match collision.get_collider().get_flag():
		"player":
			pass
			
		"enemy":
			pass
			
		"npc":
			pass
			
		"destructible":
			pass

func take_damage(dmg : int):
	if iframe_count > 0:
		return
	if dmg >= health:
		die()
	else:
		health = health - dmg
		iframe_count = iframes_after_damage
	
func heal(this : int):
	health = health + this
	if health > max_health:
		health = max_health
	
func die():
	#call change animations, block everything, delete after some time the thing
	#lose game if player
	pass
	
	
#animation functions:	
@warning_ignore("shadowed_variable")
func update_animation_tree(direction):
	if direction.length() > 0.1:
		direction = direction.normalized()
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		
@warning_ignore("shadowed_variable")
func pick_new_state(direction):
	if direction.length() > 0.7:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")



