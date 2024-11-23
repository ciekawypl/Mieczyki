class_name Rest extends State

@export var player : Player

func enter():
	player.global_position = player.rest_pos.global_position


func update(delta: float):
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right") or Input.is_action_just_pressed("up"): 
		transitioned.emit(self, "hold")
