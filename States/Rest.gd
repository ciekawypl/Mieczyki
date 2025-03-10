class_name Rest extends State

@export var player : Player

func enter():
	player.current_data.current_side = PlayerData.REST

func update(delta: float):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up"): 
		transitioned.emit(self, "hold")
