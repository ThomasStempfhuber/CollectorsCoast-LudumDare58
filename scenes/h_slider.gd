extends HSlider

func _ready() -> void:
	value = 70
	Global.volume = value / 100

func _on_drag_ended(_value_changed: bool) -> void:
	Global.volume = value / 100
