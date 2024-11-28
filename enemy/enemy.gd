class_name Enemy extends Node2D

@export var player : Player
var current_data : PlayerData = PlayerData.new()

signal attack_fail
signal attack_success



func check_attack(data : PlayerData):
	if data.current_side == current_data.current_side and current_data.current_action == PlayerData.BLOCK:
		attack_fail.emit()
		return
	player.get_damaged.rpc()
