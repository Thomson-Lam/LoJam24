extends RigidBody2D

@export var range: float = 100
@export var speed: float = 10

var startPos
var timePassed;

var directionVector



# Called when the node enters the scene tree for the first time.
func _ready():
	startPos = Vector2.ZERO
	print(startPos.x)
	startPos = global_position
	timePassed = 0
	print(startPos.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	timePassed += delta
	directionVector = sin(timePassed * speed) * range
	global_position.x = startPos.x + directionVector
	
func IsMoving():
	return global_position.x
