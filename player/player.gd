class_name Player extends Sprite2D

@export var health = 5

signal state_changed(data : PlayerData)
signal attack(data : PlayerData)

signal won_signal
signal lost_signal

var current_data : PlayerData = PlayerData.new()

@export var left_pos : Marker2D
@export var up_pos : Marker2D
@export var right_pos : Marker2D
@export var rest_pos : Marker2D


@rpc("any_peer")
func get_damaged():
	health -= 1
	if health == 0:
		lost()
		won.rpc()


func lost():
	$"State Machine".force_transition("lost")
	lost_signal.emit()


@rpc("any_peer")
func successful_attack():
	pass

@rpc("any_peer")
func won():
	$"State Machine".force_transition("won")
	won_signal.emit()
