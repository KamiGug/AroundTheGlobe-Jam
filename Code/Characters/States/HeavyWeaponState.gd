class_name HeavyWeaponState
extends State

@export_range(1, 10) var damage: int = 15
@export_range(75, 400) var knockback_strength: float = 250

# Called when the node enters the scene tree for the first time.

@warning_ignore("shadowed_variable")
func _enter(direction:Vector2):
	super(direction)
	statee.state_machine.travel("HeavyWeapon")
	statee.animation_tree.set("parameters/HeavyWeapon/blend_position", direction)
	has_to_finish = false
	can_finish = true
	statee.velocity = Vector2.ZERO
	statee.direction = direction
	
func _exit():
	super()
	
func _physics_process(_delta):
	if statee.iframe_count > 0:
		statee.iframe_count -= 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func deal_damage(attackee: Node2D, direction:Vector2):
	if attackee.has_method("take_damage"):
		attackee.take_damage(damage, knockback_strength, direction.normalized())
	pass

func _on_heavy_attack_finished():
	has_to_finish = true
	can_finish = true
