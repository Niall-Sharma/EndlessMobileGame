extends CanvasLayer

var tempScore = 0
var highscore = Highscore.load_score()
func _ready():
	print(str(highscore))

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")


func _on_try_again_button_pressed():
	get_tree().change_scene_to_file("res://Master/Master.tscn")

func _on_score_count_up_timeout():
	$VBoxContainer/HighscoreLabel.text = "Highscore: " +str(tempScore)
	if(tempScore!=highscore):
		$HighScoreCountUp.start()
	else:
		$HighScoreCountUp.stop()
	tempScore+= 1
