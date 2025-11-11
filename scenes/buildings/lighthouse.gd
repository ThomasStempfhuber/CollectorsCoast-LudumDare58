extends StaticBody2D


var built =false


func _ready():
	var anim = $AnimatedSprite2D
	anim.play("lot")


func get_built():
	var anim = $AnimatedSprite2D
	anim.play("built")
	built = true
