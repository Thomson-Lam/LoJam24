extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var scene = load("res://Scenes/presentScene.tscn")	
	var instance = scene.instantiate()
	add_child(instance)
	
