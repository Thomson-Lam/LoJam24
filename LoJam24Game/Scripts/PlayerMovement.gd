extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var direction

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	position += speed * delta * direction
