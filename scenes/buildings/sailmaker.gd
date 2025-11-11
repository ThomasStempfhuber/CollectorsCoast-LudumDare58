extends StaticBody2D

var production = 0
var in_prod = false

var collisions = 0
var placed = false

const RATE = 35

func _ready():
	$ProdBar.hide()

func _process(delta):
	if not placed:
		placing()
	else:
		if in_prod:
			produce(delta)
		else:
			start_prod()
		var prod_bar = $ProdBar
		prod_bar.value = production


func produce(delta):
	production = production + RATE * delta
	if production >= 100:
		harvest()

func start_prod():
	production = 0
	if Global.flax >= 1:
		Global.flax = Global.flax - 1
		in_prod = true
	else:
		in_prod = false

func harvest():
	if Global.sails < Global.storage_limit:
		Global.sails = Global.sails + 1
		Global.sails_collected = Global.sails_collected + 1
		$ResLabel.show_label()
		start_prod()
	else:
		production = 100


func placing():
	$Sprite2D.modulate.a = 0.6
	position.x = get_global_mouse_position().x
	position.y = get_global_mouse_position().y

func place():
	Global.placing = false
	placed = true
	Global.sailmakers_built = Global.sailmakers_built + 1
	$ProdBar.show()
	$Sprite2D.modulate.a = 1

func abort():
	Global.placing = false
	Global.planks  = min(Global.planks  + Global.SAM_PLANKS_COST   , Global.storage_limit)
	Global.stone = min(Global.stone + Global.SAM_STONE_COST , Global.storage_limit)
	Global.fruit = min(Global.fruit + Global.SAM_FRUIT_COST  , Global.storage_limit)
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
