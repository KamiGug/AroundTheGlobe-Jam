class_name Weapon
extends Skill



# Called when the node enters the scene tree for the first time.



func deal_damage(attackee: Node2D, direction:Vector2):
	if attackee.has_method("take_damage"):
		attackee.take_damage(damage, knockback_strength, direction.normalized())
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
