extends ColorRect

var here : bool

func _ready() -> void:
	$AnimationPlayer.play("big text")
	if Global.won:
		#$Label.text = "WYGRANO"
		$wygrano.show()
		$przegrano.hide()
	else:
		#$Label.text = "WYGRANO" #do zmiany
		$wygrano.hide()
		$przegrano.show()


func _process(delta: float) -> void:
	if Input.is_action_pressed("attack"):
		$oczekiwanie.show()
		here = true
		check.rpc()
	else:
		$oczekiwanie.hide()
		here = false

@rpc("any_peer")
func check():
	if here:
		start_game.rpc()

@rpc("any_peer", "call_local")
func start_game():
	get_tree().change_scene_to_file("res://main/Game.tscn")
