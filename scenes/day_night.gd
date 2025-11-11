extends CanvasModulate

@export var gradient:GradientTexture1D

var time: float = PI

var day = true

const RATE = 0.02

signal evening() 
signal morning() 

func _process(delta: float) -> void:
	time = time + delta * RATE
	var val = (sin(time - PI / 2) + 1) / 2
	color = gradient.gradient.sample(val)
	if val >= 0.3:
		if not day:
			emit_signal("morning")
			day = true
	else:
		if day:
			emit_signal("evening")
			day = false
