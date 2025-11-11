extends StaticBody2D


var production = 0

var collisions = 0
var placed = false

const RATE = 25

func _ready():
	$ProdBar.hide()

func _process(delta):
	if not placed:
		placing()
	else:
		play_animation()
		produce(delta)
		var prod_bar = $ProdBar
		prod_bar.value = production

func play_animation():
	var anim = $AnimatedSprite2D
	anim.play("default")

func produce(delta):
	production = production + RATE * delta
	if production >= 100:
		harvest()

func harvest():
	if Global.flax < Global.storage_limit:
		Global.flax = Global.flax + 1
		Global.flax_collected = Global.flax_collected + 1
		$ResLabel.show_label()
		production = 0
	else:
		production = 100



func placing():
	$AnimatedSprite2D.modulate.a = 0.6
	position.x = get_global_mouse_position().x
	position.y = get_global_mouse_position().y

func place():
	Global.placing = false
	placed = true
	Global.flaxfarms_built = Global.flaxfarms_built + 1
	$ProdBar.show()
	$AnimatedSprite2D.modulate.a = 1

func abort():
	Global.placing = false
	Global.planks  = min(Global.planks  + Global.FF_PLANKS_COST , Global.storage_limit)
	Global.stone = min(Global.stone + Global.FF_STONE_COST , Global.storage_limit)
	Global.fruit = min(Global.fruit + Global.FF_FRUIT_COST , Global.storage_limit)
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
