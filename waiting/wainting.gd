extends ColorRect

var here : bool

func _ready() -> void:
	$AnimationPlayer.play("big text")
	if Global.won:
		$Label.text = "WYGRANO"
	else:
		$Label.text = "PRZEGRANO"


func _process(delta: float) -> void:
	if Input.is_action_pressed("attack"):
		$Label3.show()
		here = true
		check.rpc()
	else:
		$Label3.hide()
		here = false

@rpc("any_peer")
func check():
	if here:
		start_game.rpc()

@rpc("any_peer", "call_local")
func start_game():
	get_tree().change_scene_to_file("res://main/Game.tscn")
