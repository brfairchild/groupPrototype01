extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.008
const MOUSE_SENSITIVITY_y = 0.1
@export var camera: NodePath
var rotation_y = 0.0
var camera_pitch = 0.0
var is_teleported_up = false  # Flag to track teleportation state

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_y -= event.relative.x * MOUSE_SENSITIVITY
		rotation.y = rotation_y
	
		camera_pitch -= event.relative.y * MOUSE_SENSITIVITY_y
		camera_pitch = clamp(camera_pitch, -90, 90)

		var camera_node = get_node(camera) as Camera3D
		if camera_node:
			camera_node.rotation_degrees.x = camera_pitch
	
	# Check if the "act_cam" action is pressed for teleportation
	if Input.is_action_just_pressed("act_cam"):
		toggle_teleport()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

# Toggle teleportation up or down by 500 units
func toggle_teleport() -> void:
	if is_teleported_up:
		position.y -= 5  # Move down
	else:
		position.y += 5  # Move up

	is_teleported_up = !is_teleported_up  # Toggle state
