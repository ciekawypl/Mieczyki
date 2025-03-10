class_name Hold extends State

@export var player : Player
@export var hold_timer : Timer

var current_key : String
var ready_to_exit : bool

func enter():
	hold_timer.start()
	ready_to_exit = false
	
	if Input.is_action_pressed("up"):
		current_key = "up"
		player.current_data.current_side = PlayerData.UP
	elif Input.is_action_pressed("left"):
		current_key = "left"
		player.current_data.current_side = PlayerData.LEFT
	elif Input.is_action_pressed("right"):
		current_key = "right"
		player.current_data.current_side = PlayerData.RIGHT


func update(_delta: float):
	if ready_to_exit and not Input.is_action_pressed(current_key):
		transitioned.emit(self, "rest")
	
	if Input.is_action_just_pressed("block"):
		transitioned.emit(self, "block")
	
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self, "attack")


func _on_hold_timer_timeout() -> void:
	ready_to_exit = true
