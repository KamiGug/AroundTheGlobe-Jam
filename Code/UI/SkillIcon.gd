class_name SkillIcon
extends Control

@export var skill_to_monitor: Skill
@onready var cd_shower = $CDProgressBar
@onready var charge_shower = $ChargeNumber

# Called when the node enters the scene tree for the first time.
func _ready():
	if typeof(skill_to_monitor) == TYPE_NIL:
		$Icon.texture = load("res://Assets/UI/skill_icon.png")
	else:
		var icon_file:String = "res://Assets/UI/skill_icon_" + skill_to_monitor.name.to_lower() +".png"
		if ResourceLoader.exists(icon_file):
			$Icon.texture = load(icon_file)
		else:
			$Icon.texture = load("res://Assets/UI/skill_icon.png")
		cd_shower.max_value = skill_to_monitor.max_cd
		cd_shower.value = skill_to_monitor.current_cd
		charge_shower.text = ""
		
	charge_shower.text = ""
	
	if typeof(skill_to_monitor) == TYPE_NIL:
		set_process(false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if skill_to_monitor.current_charges > 0:
		charge_shower.text = str(skill_to_monitor.current_charges)
	else:
		charge_shower.text = ""
	cd_shower.value = skill_to_monitor.current_cd
	pass


