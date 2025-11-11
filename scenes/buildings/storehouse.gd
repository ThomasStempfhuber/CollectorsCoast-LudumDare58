extends StaticBody2D


const STORAGE = 20

var collisions = 0
var placed = false

func _ready():
	pass

func _process(_delta):
	if not placed:
		placing()

func placing():
	$Sprite2D.modulate.a = 0.6
	position.x = get_global_mouse_position().x
	position.y = get_global_mouse_position().y

func place():
	Global.placing = false
	placed = true
	Global.storehouses_built = Global.storehouses_built + 1
	Global.storage_limit = Global.storage_limit + STORAGE
	$Sprite2D.modulate.a = 1

func abort():
	Global.placing = false
	Global.wood = min(Global.wood + Global.SH_WOOD_COST , Global.storage_limit)
	Global.stone = min(Global.stone + Global.SH_STONE_COST, Global.storage_limit)
	Global.planks = min(Global.planks + Global.SH_PLANKS_COST , Global.storage_limit)
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
