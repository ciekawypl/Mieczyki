extends Node2D

@export var player : Player

func when_won():
	$"won Label".show()


func when_lost():
	$"lost Label".show()


func get_state(data : PlayerData):
	send_state.rpc(data.current_side, data.current_action)


#do przeniesienia do enemy
@rpc("any_peer")
func send_state(side, action):
	$Enemy.current_data.current_side = side
	$Enemy.current_data.current_action = action
	
	if side == PlayerData.LEFT:
		$Label.text = "left"
	elif side == PlayerData.RIGHT:
		$Label.text = "right"
	elif side == PlayerData.UP:
		$Label.text = "up"
	elif side == PlayerData.REST:
		$Label.text = "rest"
	
	if action == PlayerData.BLOCK:
		$Label.text += " " + "block"
	elif action == PlayerData.ATTACK:
		$Label.text += " " + "attack"
