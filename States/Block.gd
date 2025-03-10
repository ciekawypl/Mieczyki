class_name Block extends State

@export var player : Player
@export var block_timer : Timer

var ready_to_exit : bool

func enter():
	player.current_data.current_action = PlayerData.BLOCK
	ready_to_exit = false
	block_timer.start()


func exit():
	player.current_data.current_action = PlayerData.NONE
	player.self_modulate = player.modulate


func update(_delta: float):
	if ready_to_exit and not Input.is_action_pressed("block"):
		transitioned.emit(self, "hold")


func _on_block_timer_timeout() -> void:
	ready_to_exit = true
