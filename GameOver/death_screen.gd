extends CanvasLayer

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")


func _on_try_again_button_pressed():
	get_tree().change_scene_to_file("res://Master/Master.tscn")
