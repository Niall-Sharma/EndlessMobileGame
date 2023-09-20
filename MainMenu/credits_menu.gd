extends VBoxContainer

func _on_button_pressed():
	get_parent().get_child(1).show()
	get_tree().queue_delete(self)
