extends VBoxContainer


func _on_back_pressed():
	get_parent().get_child(1).show()
	get_tree().queue_delete(self)


func _on_data_wipe_button_pressed():
	Highscore.destroy_data()
