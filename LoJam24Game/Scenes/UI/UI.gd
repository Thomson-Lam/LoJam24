extends CanvasLayer
class_name UI

@onready var score_label = %Score
@onready var bar = %Bar

var score = 0: # Setter 
	set(new_score):
		score = new_score
		_update_score_label()


# Called when the node enters the scene tree for the first time.
func _ready():
	_update_score_label()


func _update_score_label():
	score_label.text = str(score)


# add link signal to update score 
func _triggered_signal(collectable) -> void:
	if collectable:
		score += 1 # placeholder 





