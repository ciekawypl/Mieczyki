class_name Hold extends State

@export var player : Player
@export var hold_timer : Timer

var current_key : String
var ready_to_exit : bool

func enter():
	hold_timer.start()
	ready_to_exit = false
	
	if Input.is_action_pressed("up"):
		player.global_position = player.up_pos.global_position
		current_key = "up"
	elif Input.is_action_pressed("left"):
		player.global_position = player.left_pos.global_position
		current_key = "left"
	elif Input.is_action_pressed("right"):
		player.global_position = player.right_pos.global_position
		current_key = "right"


func update(_delta: float):
	if ready_to_exit and not Input.is_action_pressed(current_key):
		transitioned.emit(self, "rest")
	
	if Input.is_action_just_pressed("block"):
		transitioned.emit(self, "block")


func _on_hold_timer_timeout() -> void:
	ready_to_exit = true
