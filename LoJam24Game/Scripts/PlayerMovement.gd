extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var direction
var mousePos = Vector2(0, 0)
var playerPos = Vector2(0, 0)
var inPresent = true
var offSet = 10000
@export var switchOverlay : Node2D
var canMove = true

@onready var camera := get_viewport().get_camera_2d()

func _ready():
	camera = get_viewport().get_camera_2d()
	switchOverlay.visible = false
	pass

func _physics_process(delta):
	mousePos = get_global_mouse_position()
	look_at(mousePos)
	direction = Input.get_vector("left", "right", "up", "down")
	if canMove:
		position += speed * delta * direction
	playerPos = position
	
func _input(event):
	if event.is_action_pressed("SwapScene"):
		SwapAreas()
	

func SwapAreas():
	if camera == null:
		camera = get_viewport().get_camera_2d()
	if switchOverlay == null:
		switchOverlay = get_node("CanvasOverlay/SwitchOverlay")
	
	if inPresent == true:
		position += Vector2(offSet, 0)
	else:
		position -= Vector2(offSet, 0)
	
	switchOverlay.visible = true
	canMove = false
	await get_tree().create_timer(0.9).timeout
	switchOverlay.visible = false
	canMove = true

	inPresent = !inPresent
