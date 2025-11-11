extends StaticBody2D


var stone_count = 0
var production = 0

var collisions = 0
var placed = false

var res_collisions=0

const RATE = 9

func _ready():
	$ProdBar.hide()

func _process(delta):
	if not placed:
		placing()
	else:
		produce(delta)
		var prod_bar = $ProdBar
		prod_bar.value = production



func produce(delta):
	production = production + stone_count * RATE * delta
	if production >= 100:
		harvest()

func harvest():
	if Global.stone < Global.storage_limit:
		Global.stone = Global.stone + 1
		Global.stone_collected = Global.stone_collected + 1
		$ResLabel.show_label()
		production = 0
	else:
		production = 100


func placing():
	$Sprite2D.modulate.a = 0.6
	position.x = get_global_mouse_position().x
	position.y = get_global_mouse_position().y

func place():
	Global.placing = false
	placed = true
	Global.stonecutters_built = Global.stonecutters_built + 1
	stone_count = res_collisions
	$FarmArea.free()
	$ProdBar.show()
	$Sprite2D.modulate.a = 1

func abort():
	Global.placing = false
	Global.wood = min(Global.wood + Global.SC_WOOD_COST , Global.storage_limit)
	Global.fruit = min(Global.fruit + Global.SC_FRUIT_COST, Global.storage_limit)
	self.queue_free()

func _unhandled_input(event):
	if placed or event.is_echo():
		return
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			if collisions == 0: 
				place()
		if event.button_index == MOUSE_BUTTON_RIGHT:
			abort()

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if not placed:
		collisions = collisions + 1
		$Sprite2D.modulate.r = 200
		$Sprite2D.modulate.g = 0.5
		$Sprite2D.modulate.b = 0.5


func _on_area_2d_area_exited(_area: Area2D) -> void:
	if not placed:
		collisions = collisions - 1
		if collisions == 0:
			$Sprite2D.modulate.r = 1
			$Sprite2D.modulate.g = 1
			$Sprite2D.modulate.b = 1

func _on_farm_area_area_entered(_area: Area2D) -> void:
	res_collisions = res_collisions + 1


func _on_farm_area_area_exited(_area: Area2D) -> void:
	res_collisions = res_collisions - 1
