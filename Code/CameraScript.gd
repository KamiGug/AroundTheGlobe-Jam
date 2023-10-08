extends Camera2D

@export var target : Node
# Called when the node enters the scene tree for the first time.

var diff_vector = null
const LERP_SPEED = 5
var velocity = 0
var target_xform
#func _ready():
#	if target_path:
#		target = get_node(target_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !target:
		return
	
	target_xform = target.global_transform.translated_local(offset)
	global_transform = global_transform.interpolate_with(target_xform, LERP_SPEED * delta)
