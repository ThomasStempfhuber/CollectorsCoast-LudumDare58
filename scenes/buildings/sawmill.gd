extends StaticBody2D

var production = 0
var in_prod = false

var collisions = 0
var placed = false

const RATE = 50

func _ready():
	$ProdBar.hide()

func _process(delta):
	if not placed:
		placing()
	else:
		play_animation()
		if in_prod:
			produce(delta)
		else:
			start_prod()
		var prod_bar = $ProdBar
		prod_bar.value = production


func play_animation():
	var anim = $AnimatedSprite2D
	if  in_prod:
		anim.play("default")
	else:
		anim.stop()

func produce(delta):
	production = production + RATE * delta
	if production >= 100:
		harvest()

func start_prod():
	production = 0
	if Global.wood >= 1:
		Global.wood = Global.wood - 1
		in_prod = true
	else:
		in_prod = false

func harvest():
	if Global.planks < Global.storage_limit:
		Global.planks = Global.planks + 1
		Global.planks_collected = Global.planks_collected + 1
		$ResLabel.show_label()
		start_prod()
	else:
		production = 100


func placing():
	$AnimatedSprite2D.modulate.a = 0.6
	position.x = get_global_mouse_position().x
	position.y = get_global_mouse_position().y

func place():
	Global.placing = false
	placed = true
	Global.sawmills_built = Global.sawmills_built + 1
	$ProdBar.show()
	$AnimatedSprite2D.modulate.a = 1

func abort():
	Global.placing = false
	Global.wood = min(Global.wood + Global.SM_WOOD_COST  , Global.storage_limit)
	Global.stone = min(Global.stone + Global.SM_STONE_COST , Global.storage_limit)
	Global.fruit = min(Global.fruit + Global.SM_FRUIT_COST  , Global.storage_limit)
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
		$AnimatedSprite2D.modulate.r = 200
		$AnimatedSprite2D.modulate.g = 0.5
		$AnimatedSprite2D.modulate.b = 0.5


func _on_area_2d_area_exited(_area: Area2D) -> void:
	if not placed:
		collisions = collisions - 1
		if collisions == 0:
			$AnimatedSprite2D.modulate.r = 1
			$AnimatedSprite2D.modulate.g = 1
			$AnimatedSprite2D.modulate.b = 1
