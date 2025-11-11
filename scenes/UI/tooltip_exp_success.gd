extends PanelContainer


var treasures_announced = 0
var queued = 0
var showing = false

var opacity_tween: Tween = null

func _ready():
	hide()


func toggle():
	if showing:
		queued = queued + 1
	else:
		set_treasure_text()
		show()
		showing = true
		modulate.a = 1.0
		await tween_opacity(1.0).finished
		await tween_opacity(1.0).finished
		await tween_opacity(0.0).finished
		hide()
		treasures_announced = treasures_announced + 1
		showing = false
		if queued > 0:
			queued = queued -1
			toggle()

func set_treasure_text():
	var icon = ""
	if treasures_announced == 0:
		icon = "[img]res://assets/art/icons/TreasureIcon1.png[/img]"
	elif treasures_announced == 1:
		icon = "[img]res://assets/art/icons/TreasureIcon2.png[/img]"
	elif treasures_announced == 2:
		icon = "[img]res://assets/art/icons/TreasureIcon3.png[/img]"
	elif treasures_announced == 3:
		icon = "[img]res://assets/art/icons/TreasureIcon4.png[/img]"
	elif treasures_announced == 4:
		icon = "[img]res://assets/art/icons/TreasureIcon5.png[/img]"
	elif treasures_announced == 5:
		icon = "[img]res://assets/art/icons/TreasureIcon6.png[/img]"
	else:
		icon = "[img]res://assets/art/icons/TreasureIcon7.png[/img]"
	$RichTextLabel.text = "An Expedition returned with a new artefact" + icon

func tween_opacity(to: float):
	if opacity_tween: opacity_tween.kill()
	opacity_tween = get_tree().create_tween()
	opacity_tween.tween_property(self, 'modulate:a', to, 2)
	return opacity_tween
