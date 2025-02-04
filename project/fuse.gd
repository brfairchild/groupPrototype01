extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	Global.Fuse += 1
	print("Fuse Level is")
	print(Global.Fuse)
# i have literally no clue how to write the code for this. its just (when click on item it adds 1 to the
# global fuse) but I don't know how to do that code within the fuse.
