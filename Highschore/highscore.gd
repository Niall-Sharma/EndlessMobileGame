extends Node2D

var scoreFile = "user://save_game.data"
var highscore

func createData():
	var save = FileAccess.open(scoreFile, FileAccess.WRITE)
	save.store_64(int(0))
	save.close()
	return load_score()
	
func load_score():
	var f = FileAccess.open(scoreFile, FileAccess.READ)
	if FileAccess.file_exists(scoreFile):	
		highscore = f.get_64()
		return highscore
	return createData()

func save_data(score:int):
	var f = FileAccess.open(scoreFile, FileAccess.WRITE)
	f.store_64(score)

func destroy_data():
	var f = FileAccess.open(scoreFile, FileAccess.WRITE)
	print("data destroyed")
	f.store_64(int(0))
