extends RayCast3D
var intText

func _physics_process(_delta):
	intText = get_node("/root/" + get_tree().current_scene.name + "/UI/IntText")
	
	if is_colliding():
		var collider = get_collider()
		
		if collider.has_method("interact"):
			intText.visible = true
			print("Door")
			if Input.is_action_just_pressed("interact"):
				collider.interact()
			else:
				intText.visible = false
		else:
				intText.visible = false
	else:
		intText.visible = false
