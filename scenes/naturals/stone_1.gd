extends StaticBody2D


func _on_area_2d_area_entered(_area: Area2D) -> void:
	$Sprite2D.modulate.r = 0.5
	$Sprite2D.modulate.g = 2
	$Sprite2D.modulate.b = 0.5


func _on_area_2d_area_exited(_area: Area2D) -> void:
	$Sprite2D.modulate.r = 1
	$Sprite2D.modulate.g = 1
	$Sprite2D.modulate.b = 1
