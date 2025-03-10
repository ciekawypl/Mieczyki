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


func update_txt():
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
