extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Strokes: " + str(GameManager.player1[0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://level.tscn")
	pass # Replace with function body.
