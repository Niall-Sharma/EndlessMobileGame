extends StaticBody2D

signal givePoint

var sprites = [preload("res://Master/PlayerSprite.png"), preload("res://Master/RandomSprite.png"), preload("res://Master/RandomSpriteDry.png"),preload("res://Master/PlayerSprite.png"),preload("res://Master/RandomSprite1.png"),preload("res://Master/RandomSprite2.png"),preload("res://Master/RandomSprite3.png"),preload("res://Master/RandomSprite4.png"),preload("res://Master/RandomSprite5.png"),preload("res://Master/RandomSprite6.png")]

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = randf_range(0, sprites.size())
	$Sprite2D.set_texture(sprites[rand])



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_collision_area_body_entered(body):
	if body.name == "Player":
		emit_signal("givePoint")
		get_tree().queue_delete(self)
