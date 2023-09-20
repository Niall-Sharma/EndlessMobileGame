extends RigidBody2D

var dir = Vector2.ZERO


func _ready():
	get_parent().connect("_player_has_died", _die)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	linear_velocity = dir
	dir = lerp(dir, Vector2.ZERO, 0.03)

func _die():
	get_child(2).reparent(get_parent())
	var deathEffect = preload("res://DeathEffect.tscn")
	get_parent().add_child(deathEffect.instantiate())
	get_tree().queue_delete(self)
