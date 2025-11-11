extends StaticBody2D


func _ready() -> void:
	var anim = $AnimatedSprite2D
	anim.play("idle")

func _on_area_2d_area_entered(_area: Area2D) -> void:
	$AnimatedSprite2D.modulate.r = 0.5
	$AnimatedSprite2D.modulate.g = 2
	$AnimatedSprite2D.modulate.b = 0.5


func _on_area_2d_area_exited(_area: Area2D) -> void:
	$AnimatedSprite2D.modulate.r = 1
	$AnimatedSprite2D.modulate.g = 1
	$AnimatedSprite2D.modulate.b = 1
