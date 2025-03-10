extends Node2D

@export var player : Player

@rpc("any_peer", "call_local")
func on_end():
	get_tree().change_scene_to_file("res://waiting/Wainting.tscn")


func when_won():
	Global.won = true
	on_end.rpc()


func when_lost():
	Global.won = false


func get_state(data : PlayerData):
	send_state.rpc(data.current_side, data.current_action)


#do przeniesienia do enemy
@rpc("any_peer")
func send_state(side, action):
	$Enemy.current_data.current_side = side
	$Enemy.current_data.current_action = action
	$Enemy.update_txt()
