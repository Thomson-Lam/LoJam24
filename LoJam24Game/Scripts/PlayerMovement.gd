extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var direction
var mousePos = Vector2(0, 0)
var playerPos = Vector2(0, 0)
var inPresent = true

@onready var camera := get_viewport().get_camera_2d()

func _enter_tree():
	camera = get_viewport().get_camera_2d()
	pass

func _physics_process(delta):
	mousePos = get_global_mouse_position()
	look_at(mousePos)
	direction = Input.get_vector("left", "right", "up", "down")
	position += speed * delta * direction
	playerPos = position
	
func _input(event):
	if event.is_action_pressed("SwapScene"):
		SwapAreas()
	

func SwapAreas():
	if inPresent == true:
		position += Vector2(500, 0)
	else:
		position -= Vector2(500, 0)
	camera.position_smoothing_enabled = false;
	await get_tree().create_timer(0.1).timeout
	camera.position_smoothing_enabled = true;
	inPresent = !inPresent
