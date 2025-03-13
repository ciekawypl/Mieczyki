class_name Bar extends CanvasLayer

@export var timer : Timer
@export var bar : TextureProgressBar
var max : float

func _ready() -> void:
	max = timer.wait_time


func _process(delta: float) -> void:
	bar.value = (timer.time_left/max)*100
