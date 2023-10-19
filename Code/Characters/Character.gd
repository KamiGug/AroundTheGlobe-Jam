extends CharacterBody2D
class_name Character

@export var speed = 160
var iframe_count : int = 15 #important to all characters to have iframes (or they'd die 2 fast)
var max_health : int = 3000
var health : int = max_health
@export var iframes_after_damage = 10
var direction:Vector2

signal knocked_back

@onready var animation_tree = $AnimationTree #get animation tree #all characters will have one of those
@onready var state_machine = animation_tree.get("parameters/playback") #that is the thing that determines the states

func _init():
	pass

func _ready():
	pass

func _process(_delta):
	pass

func _physics_process(_delta):
	#if iframe_count > 0:
	#	iframe_count = iframe_count - 1
	pass
	
func set_input_vector():
	#part of AI here - pathing
	pass
	
	
#func handle_collision(collision : KinematicCollision2D):
#	print(collision.id)
#	match collision.get_collider().get_flag():
#		"player":
#			pass			
#		"enemy":
#			pass			
#		"npc":
#			pass			
#		"destructible":
#			pass

func take_damage(dmg : int, knockback_value: float, direction: Vector2):
	if iframe_count > 0:
		return
	if dmg >= health:
		die()
	else:
		health = health - dmg
		iframe_count = iframes_after_damage
		knocked_back.emit(knockback_value * direction.normalized())
	
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



