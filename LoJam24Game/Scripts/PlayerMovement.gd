extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var direction
var mousePos = Vector2(0, 0)

func _physics_process(delta):
	mousePos = get_global_mouse_position()
	look_at(mousePos)
	direction = Input.get_vector("left", "right", "up", "down")
	position += speed * delta * direction
