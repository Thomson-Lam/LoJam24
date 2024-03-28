extends RigidBody2D

var speed = 400  # speed in pixels/sec
var mousePos = Vector2(0, 0)
var direction
var rayCastMiddle
var rayCastLeft
var rayCastRight
var jumpHeight = 350
var jumpTimer = 0
var maxJumpTimer = 1
var chargingJump = false
var newJump = 0
var holdingRight = false

@onready var landingSpot: Node2D = $LandingSpot
@onready var camera := get_viewport().get_camera_2d()

func _ready():
	camera = get_viewport().get_camera_2d()
	rayCastMiddle = find_child("RayCastMiddle")
	rayCastRight = find_child("RayCastRight")
	rayCastLeft = find_child("RayCastLeft")
	landingSpot = get_parent().get_node("LandingSpot")
	pass

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
func _process(delta):
	if chargingJump and jumpTimer < 1:
		jumpTimer += delta * 1.2
		
	if jumpTimer > 1:
		jumpTimer = 1
	if chargingJump:
		landingSpot.visible = true
		if holdingRight:
			var newVector = Vector2(position.x + (jumpTimer * 125), position.y)
			landingSpot.global_position = newVector
		elif not holdingRight:
			var newVector = Vector2(position.x - (jumpTimer * 125), position.y)
			landingSpot.global_position = newVector
	
		

		
func _input(event):
	newJump = jumpTimer * jumpHeight + 100
	
	if CheckGround():
		if event.is_action_pressed("up"):
			chargingJump = true
		elif event.is_action_pressed("right"):
			chargingJump = true
			holdingRight = true
		elif event.is_action_pressed("left"):
			chargingJump = true
			
		if event.is_action_released("up"):
			apply_central_impulse(Vector2(0, -newJump * 1.5))
			chargingJump = false
			holdingRight = false
			jumpTimer = 0
		elif event.is_action_released("right"):
			apply_central_impulse(Vector2(newJump / 3, -newJump))
			chargingJump = false
			holdingRight = false
			jumpTimer = 0
		elif event.is_action_released("left"):
			apply_central_impulse(Vector2(-newJump / 3, -newJump))	
			chargingJump = false
			holdingRight = false
			jumpTimer = 0
		#landingSpot.global_position = position
			
			
func CheckGround():
	if rayCastMiddle.is_colliding():
		return true
	if rayCastRight.is_colliding():
		return true
	if rayCastLeft.is_colliding():
		return true
	return false

