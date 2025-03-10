class_name Attack extends State

@export var player : Player
@export var attack_timer : Timer


func enter():
	player.current_data.current_action = PlayerData.ATTACK
	attack_timer.start()
	player.attack.emit(player.current_data)


func exit():
	player.current_data.current_action = PlayerData.NONE
	player.self_modulate = player.modulate
	pass


func _on_attack_timer_timeout() -> void:
	transitioned.emit(self, "hold")
