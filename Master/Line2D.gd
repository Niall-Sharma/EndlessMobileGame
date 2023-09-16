extends Line2D

@onready var player := get_parent().get_node("Player")

var starting_point = Vector2.ZERO
var ending_point = Vector2.ZERO

var playerDirection

var canSling = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(_event : InputEvent) -> void:
	if canSling:
		if Input.is_action_just_pressed("click"):
			starting_point = player.position
			ending_point = starting_point
		if Input.is_action_pressed("click"):
			ending_point = get_global_mouse_position()
			points[0] = player.position
			points[1] = get_global_mouse_position()
			Engine.time_scale = 0.25
		if Input.is_action_just_released("click"):
			Engine.time_scale = 1
			player.dir = ((ending_point - player.position)*4)
			points[0] = Vector2.ZERO
			points[1] = Vector2.ZERO
			canSling = false



		
	
