class_name Failure extends State

@export var player : Player
@export var timer : Timer

func enter():
	player.current_data.current_side = PlayerData.FAILURE
	timer.start()


func exit():
	pass


func _on_timer_timeout() -> void:
	transitioned.emit(self, "rest")
