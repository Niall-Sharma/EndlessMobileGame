extends StaticBody2D

signal givePoint

var sprites = [preload("res://Point/PlanetSprites/PlayerSprite.png"), 
preload("res://Point/PlanetSprites/RandomSprite.png"), 
preload("res://Point/PlanetSprites/RandomSpriteDry.png"),
preload("res://Point/PlanetSprites/PlayerSprite.png"),
preload("res://Point/PlanetSprites/RandomSprite1.png"),
preload("res://Point/PlanetSprites/RandomSprite2.png"),
preload("res://Point/PlanetSprites/RandomSprite3.png"),
preload("res://Point/PlanetSprites/RandomSprite4.png"),
preload("res://Point/PlanetSprites/RandomSprite5.png"),
preload("res://Point/PlanetSprites/RandomSprite6.png")]

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = randf_range(0, sprites.size())
	$Sprite2D.set_texture(sprites[rand])

func _on_collision_area_body_entered(body):
	if body.name == "Player":
		emit_signal("givePoint")
		get_tree().queue_delete(self)
