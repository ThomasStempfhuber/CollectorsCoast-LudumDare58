extends Control

var timed_out = false


func _on_timer_timeout() -> void:
	timed_out = true


func _input(event: InputEvent) -> void:
	if timed_out and event.is_pressed():
		Global.score()
