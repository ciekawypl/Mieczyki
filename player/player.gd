extends Sprite2D

enum {LEFT, UP, RIGHT}

var is_held : bool

@export var left_pos : Marker2D
@export var up_pos : Marker2D
@export var right_pos : Marker2D
var rest_pos : Vector2

@export var hold_timer : Timer

func _ready() -> void:
	rest_pos = global_position


func draw_sword(side):
	is_held = true
	
	if side == UP:
		global_position = up_pos.global_position
	elif side == LEFT:
		global_position = left_pos.global_position
	elif side == RIGHT:
		global_position = right_pos.global_position


func rest_sword():
	global_position = rest_pos


func _process(delta: float) -> void:
	#print(hold_timer.time_left)
	if not is_held:
		if Input.is_action_pressed("up"):
			draw_sword(UP)
		elif Input.is_action_pressed("left"):
			draw_sword(LEFT)
		elif Input.is_action_pressed("right"):
			draw_sword(RIGHT)
	else:
		if not Input.is_anything_pressed():
			is_held = false
			hold_timer.start()


func _on_hold_timer_timeout() -> void:
	rest_sword()
