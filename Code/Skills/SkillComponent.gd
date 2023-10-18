extends Node2D
class_name SkillComponent
#can use for UI elements like timers for cds etc
#will listen for signals and use skills

var global_cd_max: float = 0.25
var global_cd_current:float = 0

var skills: Array[Skill]

# Called when the node enters the scene tree for the first time.
func _ready():
	skills.resize(get_child_count())
	var i:int = 0
	for skill in get_children():
		skills[i] = get_child(i)
		i += 1
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#set up listners like that
#func _on_skill1:
#	skill
