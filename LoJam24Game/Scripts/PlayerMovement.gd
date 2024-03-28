extends RigidBody2D

var speed = 400  # speed in pixels/sec
var mousePos = Vector2(0, 0)
var direction
var rayCast
var jumpHeight := 350

@onready var camera := get_viewport().get_camera_2d()

func _ready():
	camera = get_viewport().get_camera_2d()
	rayCast = $CollisionShape2D/RayCast2D
	pass

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
func _input(event):
	
	if rayCast.is_colliding():
		if event.is_action_pressed("up"):
			apply_central_impulse(Vector2(0, -jumpHeight * 1.5))
		elif event.is_action_pressed("right"):
			apply_central_impulse(Vector2(jumpHeight / 3, -jumpHeight))
		elif event.is_action_pressed("left"):
			apply_central_impulse(Vector2(-jumpHeight / 3, -jumpHeight))	

