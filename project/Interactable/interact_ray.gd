extends RayCast3D

var target


func _process(delta):
	if is_colliding():
		Global.canInteract = true
		if Input.is_action_just_pressed("interact"):
			print("pressed")
#			#flipSwitch()
	
	if is_colliding():
		target = get_collider()
		if target.has_method("interact"):
			if Input.is_action_just_pressed("interact"):
				target.interact()
