extends SpotLight3D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.LightValue1 == true:
		visible = true
	if Global.LightValue1 == false:
		visible = false
		
