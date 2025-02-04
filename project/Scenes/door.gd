extends Node3D

var open


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	open = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	print("Interacted")
	if open == false:
		$AnimationPlayer.play("Open")
		open = true
	if open == true:
		$AnimationPlayer.play("close")
		open = false
