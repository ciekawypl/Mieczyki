class_name Hpleft extends CanvasLayer

@export var player : Player
@export var anim : AnimationPlayer

func update():
	show()
	if player.health == 4:
		anim.play("4")
	if player.health == 3:
		anim.play("3")
	if player.health == 2:
		anim.play("2")
	if player.health == 1:
		anim.play("1")
	if player.health == 0:
		anim.play("0")


func end():
	player.onzerohp()
