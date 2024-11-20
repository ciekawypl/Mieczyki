extends Sprite2D

var is_held : bool
var current_side

@export var left_pos : Marker2D
@export var up_pos : Marker2D
@export var right_pos : Marker2D
@export var rest_pos : Marker2D

signal side_changed(current_side : Side)
signal action(action : Action)

func _ready() -> void:
	global_position = rest_pos.global_position


func draw_sword(side):
	is_held = true
	
	if side == Side.UP:
		current_side = side
		global_position = up_pos.global_position
	elif side == Side.LEFT:
		current_side = side
		global_position = left_pos.global_position
	elif side == Side.RIGHT:
		current_side = side
		global_position = right_pos.global_position
	
	side_changed.emit(current_side)


func rest_sword():
	is_held = false
	current_side = Side.REST
	side_changed.emit(current_side)
	
	global_position = rest_pos.global_position


func _process(_delta: float) -> void:
	if not is_held:
		if Input.is_action_pressed("up"):
			draw_sword(Side.UP)
		elif Input.is_action_pressed("left"):
			draw_sword(Side.LEFT)
		elif Input.is_action_pressed("right"):
			draw_sword(Side.RIGHT)
	else:
		if not Input.is_action_pressed("left") and not Input.is_action_pressed("right") and not Input.is_action_pressed("up"):
			rest_sword()
