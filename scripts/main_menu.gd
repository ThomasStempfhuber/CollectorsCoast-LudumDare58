extends Control


func _ready() -> void:
	$AudioBG.toggle(true)

func _on_button_start_pressed() -> void:
	$AudioBG.toggle(false)
	Global.start_game()


func _on_button_exit_pressed() -> void:
	get_tree().quit()
