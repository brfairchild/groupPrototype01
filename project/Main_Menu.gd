class_name Main_Menu
extends Control
@onready var Start: Button = $Start_Game as Button
@onready var start_level = preload("res://devMap/devMap.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	Start.button_down.connect(on_Start_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_Start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		get_tree().quit()
