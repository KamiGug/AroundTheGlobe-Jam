class_name Shield
extends Projectile

var offset = 5
var caster: Character
var rotation_center_offset = Vector2(0,4)


# Called when the node enters the scene tree for the first time.
func _ready():
	var off = Vector2(offset, 0)
	$CollisionShape2D.position += off# + BOTTOM_OFFSET
	$Sprite2D.position += off# + BOTTOM_OFFSET
	position += rotation_center_offset
	rotation = caster.get_local_mouse_position().angle()
	pass # Replace with function body.

func _physics_process(_delta):
	rotation = caster.get_local_mouse_position().angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
