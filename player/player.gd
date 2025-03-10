class_name Player extends Node2D

@export var health = 5

signal state_changed(data : PlayerData)
signal attack(data : PlayerData)

signal won_signal
signal lost_signal

signal hplost

var current_data : PlayerData = PlayerData.new()

@rpc("any_peer")
func get_damaged():
	successful_attack.rpc()
	health -= 1
	hplost.emit()
	$"State Machine".force_transition("failure")


func onzerohp():
	lost()
	won.rpc()


func lost():
	$"State Machine".force_transition("lost")
	lost_signal.emit()


@rpc("any_peer")
func successful_attack():
	$"State Machine".force_transition("success")


@rpc("any_peer")
func won():
	$"State Machine".force_transition("won")
	won_signal.emit()




func update_txt(data : PlayerData):
	if current_data.current_side == PlayerData.LEFT and current_data.current_action == PlayerData.NONE:
		$AnimatedSprite2D.play("lefthold")
	if current_data.current_side == PlayerData.LEFT and current_data.current_action == PlayerData.ATTACK:
		$AnimatedSprite2D.play("leftattack")
	if current_data.current_side == PlayerData.LEFT and current_data.current_action == PlayerData.BLOCK:
		$AnimatedSprite2D.play("leftblock")
	
	if current_data.current_side == PlayerData.RIGHT and current_data.current_action == PlayerData.NONE:
		$AnimatedSprite2D.play("righthold")
	if current_data.current_side == PlayerData.RIGHT and current_data.current_action == PlayerData.ATTACK:
		$AnimatedSprite2D.play("rightattack")
	if current_data.current_side == PlayerData.RIGHT and current_data.current_action == PlayerData.BLOCK:
		$AnimatedSprite2D.play("rightblock")
	
	if current_data.current_side == PlayerData.UP and current_data.current_action == PlayerData.NONE:
		$AnimatedSprite2D.play("uphold")
	if current_data.current_side == PlayerData.UP and current_data.current_action == PlayerData.ATTACK:
		$AnimatedSprite2D.play("upattack")
	if current_data.current_side == PlayerData.UP and current_data.current_action == PlayerData.BLOCK:
		$AnimatedSprite2D.play("upblock")
	
	if current_data.current_side == PlayerData.REST:
		$AnimatedSprite2D.play("rest")
	
	if current_data.current_side == PlayerData.FAILURE:
		$AnimatedSprite2D.play("recovery")
	if current_data.current_side == PlayerData.SUCCESS:
		$AnimatedSprite2D.play("upattack")
