extends RayCast3D
@onready var prompt = $prompt

func process(delta):
	if is_colliding():
		print("pressed")
		Global.canInteract = true
		if Input.is_action_just_pressed("interact"):
			print("pressed")
			#flipSwitch()
