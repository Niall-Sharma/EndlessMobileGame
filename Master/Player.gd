extends RigidBody2D

var dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	linear_velocity = dir
	dir = lerp(dir, Vector2.ZERO, 0.03)
	#look_at(get_global_mouse_position())
