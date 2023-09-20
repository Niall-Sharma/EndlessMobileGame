extends Node2D

var pointScene = preload("res://Point/point.tscn")

@onready var scoreText = $CanvasLayer/ScoreText
@onready var playerSling = $Line2D

var score = 0

var rng = RandomNumberGenerator.new()

var deathTimeLeft = 1

var pointPos = Vector2.ZERO

var deathEffect = preload("res://DeathEffect.tscn")

var cam = preload("res://camera_2d.tscn")

signal _player_has_died

# Called when the node enters the scene tree for the first time.
func _ready():
	$deathTime.start(deathTimeLeft)
	call_deferred("_createPoint")
	$MainTheme.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$CanvasLayer/TimerBar.value = $deathTime.time_left

func _givePoint():
	score+=1
	call_deferred("_createPoint")
	call_deferred("_createPoint")
	scoreText.text = str(score)
	playerSling.canSling = true
	$deathTime.start(deathTimeLeft)
	$PickupSound.play()
	if score%50 == 0:
		$CongratsSound.play()
	
func _createPoint():
	var point = pointScene.instantiate()
	add_child(point)
	pointPos.x = randf_range(($Player.position.x-(get_viewport_rect().size.x/8)), ($Player.position.x+(get_viewport_rect().size.x/8)))
	point.position = pointPos
	point.connect("givePoint", _givePoint)
	pointPos.y -= (get_viewport_rect().size.y/6)
	
func _on_death_time_timeout():
	emit_signal("_player_has_died")
	_playerDeath()
	$deathTime.stop()

func _playerDeath():

	$DeathSound.play()
	
	get_tree().queue_delete($Line2D)
	
	_save_highscore()

	var deathScreen = preload("res://GameOver/death_screen.tscn")
	var deathScreenNode = deathScreen.instantiate()
	add_child(deathScreenNode)
	
func _save_highscore():
	var savedScore = int(Highscore.load_score())
	if score>savedScore:
		Highscore.save_data(score)
	else:
		pass

