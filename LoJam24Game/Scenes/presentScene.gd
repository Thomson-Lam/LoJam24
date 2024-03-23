extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load("res://Scenes/presentScene.tscn")
	var instance = scene.instantiate()
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
