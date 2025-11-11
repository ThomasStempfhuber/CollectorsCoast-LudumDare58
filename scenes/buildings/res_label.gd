extends RichTextLabel


var opacity_tween: Tween = null

func _ready():
	hide()

func show_label():
	show()
	modulate.a = 1.0
	await tween_opacity(0.0).finished
	hide()


func tween_opacity(to: float):
	if opacity_tween: opacity_tween.kill()
	opacity_tween = get_tree().create_tween()
	opacity_tween.tween_property(self, 'modulate:a', to, 1.5)
	return opacity_tween
