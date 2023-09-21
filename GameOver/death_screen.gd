extends CanvasLayer

var highscore = Highscore.load_score()
var score
var tempHighScore = 0
var tempScore = 0
func _ready():
	print(str(highscore))
	score = get_parent().score

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")


func _on_try_again_button_pressed():
	get_tree().change_scene_to_file("res://Master/Master.tscn")

func _on_score_count_up_timeout():
	$VBoxContainer/HighscoreLabel.text = "Highscore: " +str(tempHighScore)
	$VBoxContainer/ScoreLabel.text = "Score: " + str(tempScore)
	if(tempHighScore!=highscore || tempScore!=score):
		$HighScoreCountUp.start()
	else:
		$HighScoreCountUp.stop()
	if tempHighScore!=highscore:
		tempHighScore+= 1
	if tempScore != score:
		tempScore+=1
