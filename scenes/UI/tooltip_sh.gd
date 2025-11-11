extends PanelContainer

const OFFSET: Vector2 = Vector2(-40, -120)
var opacity_tween: Tween = null

func _ready():
	hide()

func _input(event: InputEvent):
	if visible and event is InputEventMouseMotion:
		global_position = get_global_mouse_position() + OFFSET


func toggle(on: bool):
	if on:
		show()
		modulate.a = 0.0
		tween_opacity(1.0)
	else:
		modulate.a = 1.0
		await tween_opacity(0.0).finished
		hide()



func tween_opacity(to: float):
	if opacity_tween: opacity_tween.kill()
	opacity_tween = get_tree().create_tween()
	opacity_tween.tween_property(self, 'modulate:a', to, 0.1)
	return opacity_tween


func _on_woodcutter_mouse_entered() -> void:
	pass # Replace with function body.
