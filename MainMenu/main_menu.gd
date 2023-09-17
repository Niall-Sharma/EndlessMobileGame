extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackgroundMusic.play()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Master/Master.tscn")

func _on_options_button_pressed():
	var optionsMenu = preload("res://MainMenu/options_menu_box.tscn")
	var optionsNode = optionsMenu.instantiate()
	get_child(0).add_child(optionsNode)
	$"CanvasLayer/Main Menu Box".hide()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_credit_button_pressed():
	var creditsMenu = preload("res://MainMenu/credits_menu.tscn")
	var creditsNode = creditsMenu.instantiate()
	get_child(0).add_child(creditsNode)
	$"CanvasLayer/Main Menu Box".hide()

