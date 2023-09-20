extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_back_pressed():
	get_parent().get_child(1).show()
	get_tree().queue_delete(self)


func _on_data_wipe_button_pressed():
	Highscore.destroy_data()
