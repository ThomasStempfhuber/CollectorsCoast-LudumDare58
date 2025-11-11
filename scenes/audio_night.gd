extends AudioStreamPlayer

var volume_tween: Tween = null
var v = 0

func _process(_delta):
	volume_db = v - 40 +45 * Global.volume

func toggle(on: bool):
	if on:
		play(0)
		v = -25
		tween_volume(-10)
	else:
		await tween_volume(-40).finished
		stop()


func tween_volume(to: float):
	if volume_tween: volume_tween.kill()
	volume_tween = get_tree().create_tween()
	volume_tween.tween_property(self, 'v', to, 5)
	return volume_tween
