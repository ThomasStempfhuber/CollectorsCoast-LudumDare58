extends Node2D

var hideUI = false

func _ready() -> void:
	$AudioDay.toggle(true)

func _process(delta: float) -> void:
	Global.time_used = Global.time_used + delta
	if Input.is_action_just_pressed("HideUI"):
		if hideUI:
			hideUI = false
			$UI.show()
		else:
			hideUI = true
			$UI.hide()

func _on_ui_place_woodcutter(new_building: Variant) -> void:
	add_child(new_building)  


func _on_ui_place_flaxfarm(new_building: Variant) -> void:
	add_child(new_building)  


func _on_ui_place_fruitfarm(new_building: Variant) -> void:
	add_child(new_building)  


func _on_ui_place_sailmaker(new_building: Variant) -> void:
	add_child(new_building)   


func _on_ui_place_sawmill(new_building: Variant) -> void:
	add_child(new_building)  


func _on_ui_place_stonecutter(new_building: Variant) -> void:
	add_child(new_building)  


func _on_ui_place_storehouse(new_building: Variant) -> void:
	add_child(new_building)  


func _on_ui_build_harbour() -> void:
	Global.harbours = Global.harbours + 1 
	if Global.harbours == 1:
		$Buildings/Harbour.get_built()
	elif Global.harbours == 2:
		$Buildings/Harbour2.get_built()
	elif Global.harbours == 3:
		$Buildings/Harbour3.get_built()


func _on_ui_build_lighthouse() -> void:
	Global.lighthouse = true
	$Buildings/Lighthouse.get_built()


func _on_ui_build_museum() -> void:
	Global.museum = true
	$Buildings/Museum.get_built()


func _on_ui_build_pedestals() -> void:
	Global.pedestals = true
	$Buildings/Pedestal.get_built()
	$Buildings/Pedestal2.get_built()
	$Buildings/Pedestal3.get_built()
	$Buildings/Pedestal4.get_built()
	$Buildings/Pedestal5.get_built()
	$Buildings/Pedestal6.get_built()
	$Buildings/Pedestal7.get_built()


func _on_ui_build_ship() -> void:
	Global.ships = Global.ships + 1 
	Global.ships_available = Global.ships_available + 1
	if Global.ships == 1:
		$Buildings/Ship.get_built()
	elif Global.ships == 2:
		$Buildings/Ship2.get_built()
	elif Global.ships == 3:
		$Buildings/Ship3.get_built()


func _on_ui_send_exp() -> void:
	var ship1 = $Buildings/Ship
	var ship2 = $Buildings/Ship2
	var ship3 = $Buildings/Ship3
	if not ship1.on_expedition:
		ship1.start_expedition()
		Global.ships_available = Global.ships_available - 1
	elif not ship2.on_expedition:
		ship2.start_expedition()
		Global.ships_available = Global.ships_available - 1
	elif not ship3.on_expedition:
		ship3.start_expedition()
		Global.ships_available = Global.ships_available - 1
	else:
		return

func gamble_treasure():
	var success = randi() % 3 != 0
	if Global.treasures == 0:
		success = true
	if success:
		Global.treasures = Global.treasures +1
		update_treasures(Global.treasures)
		$UI/TooltipExpSuccess.toggle()
	else:
		$UI/TooltipExpNoSuccess.toggle()

func _on_ship_ship_returned() -> void:
	Global.ships_available = Global.ships_available + 1
	gamble_treasure()


func _on_ship_2_ship_returned() -> void:
	Global.ships_available = Global.ships_available + 1
	gamble_treasure()


func _on_ship_3_ship_returned() -> void:
	Global.ships_available = Global.ships_available + 1
	gamble_treasure()

func update_treasures(num):
	if num == 1:
		$Buildings/Pedestal.fill_treasure(num)
	elif num == 2:
		$Buildings/Pedestal2.fill_treasure(num)
	elif num == 3:
		$Buildings/Pedestal3.fill_treasure(num)
	elif num == 4:
		$Buildings/Pedestal4.fill_treasure(num)
	elif num == 5:
		$Buildings/Pedestal5.fill_treasure(num)
	elif num == 6:
		$Buildings/Pedestal6.fill_treasure(num)
	elif num == 7:
		$Buildings/Pedestal7.fill_treasure(num)
		$endTimes.start()
	


func _on_day_night_evening() -> void:
	$AudioDay.toggle(false)
	$AudioNight.toggle(true)


func _on_day_night_morning() -> void:
	$AudioNight.toggle(false)
	$AudioDay.toggle(true)


func _on_end_times_timeout() -> void:
	Global.win_game()
