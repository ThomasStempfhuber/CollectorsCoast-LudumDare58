extends CanvasLayer

@export var wc: PackedScene = preload("res://scenes/buildings/woodcutter.tscn")
signal place_woodcutter(new_building)  

@export var sc: PackedScene = preload("res://scenes/buildings/stonecutter.tscn")
signal place_stonecutter(new_building)  

@export var frf: PackedScene = preload("res://scenes/buildings/fruitfarm.tscn")
signal place_fruitfarm(new_building)  

@export var sm: PackedScene = preload("res://scenes/buildings/sawmill.tscn")
signal place_sawmill(new_building)  

@export var ff: PackedScene = preload("res://scenes/buildings/flaxfarm.tscn")
signal place_flaxfarm(new_building)  

@export var sma: PackedScene = preload("res://scenes/buildings/sailmaker.tscn")
signal place_sailmaker(new_building)  

@export var sh: PackedScene = preload("res://scenes/buildings/storehouse.tscn")
signal place_storehouse(new_building)  


signal build_museum() 
signal build_pedestals() 
signal build_harbour() 
signal build_lighthouse() 
signal build_ship() 
signal send_exp() 


func _ready() -> void:
	check_projects()
	check_buttons()

func _process(_delta: float) -> void:
	check_projects()
	check_buttons()
	check_hotkeys()




func _on_woodcutter_pressed() -> void:
	if Global.placing:
		return
	if Global.stone >= Global.WC_STONE_COST and Global.fruit >= Global.WC_FRUIT_COST:
		Global.stone = Global.stone - Global.WC_STONE_COST
		Global.fruit = Global.fruit - Global.WC_FRUIT_COST
		Global.placing = true
		var new_building = wc.instantiate()
		emit_signal("place_woodcutter", new_building)


func _on_stonecutter_pressed() -> void:
	if Global.placing:
		return
	if Global.wood >= Global.SC_WOOD_COST and Global.fruit >= Global.SC_FRUIT_COST:
		Global.wood = Global.wood - Global.SC_WOOD_COST
		Global.fruit = Global.fruit - Global.SC_FRUIT_COST
		Global.placing = true
		var new_building = sc.instantiate()
		emit_signal("place_stonecutter", new_building)


func _on_foodfarm_pressed() -> void:
	if Global.placing:
		return
	if Global.wood >= Global.FRF_WOOD_COST and Global.stone >= Global.FRF_STONE_COST:
		Global.wood = Global.wood - Global.FRF_WOOD_COST
		Global.stone = Global.stone - Global.FRF_STONE_COST
		Global.placing = true
		var new_building = frf.instantiate()
		emit_signal("place_fruitfarm", new_building)


func _on_sawmill_pressed() -> void:
	if Global.placing:
		return
	if Global.wood >= Global.SM_WOOD_COST and Global.stone >= Global.SM_STONE_COST and Global.fruit >= Global.SM_FRUIT_COST:
		Global.wood = Global.wood - Global.SM_WOOD_COST
		Global.stone = Global.stone - Global.SM_STONE_COST
		Global.fruit = Global.fruit - Global.SM_FRUIT_COST
		Global.placing = true
		var new_building = sm.instantiate()
		emit_signal("place_sawmill", new_building)



func _on_flaxfarm_pressed() -> void:
	if Global.placing:
		return
	if Global.planks >= Global.FF_PLANKS_COST and Global.stone >= Global.FF_STONE_COST and Global.fruit >= Global.FF_FRUIT_COST:
		Global.planks = Global.planks - Global.FF_PLANKS_COST
		Global.stone = Global.stone - Global.FF_STONE_COST
		Global.fruit = Global.fruit - Global.FF_FRUIT_COST
		Global.placing = true
		var new_building = ff.instantiate()
		emit_signal("place_flaxfarm", new_building)

func _on_sailmaker_pressed() -> void:
	if Global.placing:
		return
	if Global.planks >= Global.SAM_PLANKS_COST and Global.stone >= Global.SAM_STONE_COST and Global.fruit >= Global.SAM_FRUIT_COST:
		Global.planks = Global.planks - Global.SAM_PLANKS_COST
		Global.stone = Global.stone - Global.SAM_STONE_COST
		Global.fruit = Global.fruit - Global.SAM_FRUIT_COST
		Global.placing = true
		var new_building = sma.instantiate()
		emit_signal("place_sailmaker", new_building)


func _on_storage_pressed() -> void:
	if Global.placing:
		return
	if Global.wood >= Global.SH_WOOD_COST and Global.planks >= Global.SH_PLANKS_COST and Global.stone >= Global.SH_STONE_COST:
		Global.wood = Global.wood - Global.SH_WOOD_COST
		Global.planks = Global.planks - Global.SH_PLANKS_COST
		Global.stone = Global.stone - Global.SH_STONE_COST
		Global.placing = true
		var new_building = sh.instantiate()
		emit_signal("place_storehouse", new_building)

func check_buttons():
	if Global.stone >= Global.WC_STONE_COST and Global.fruit >= Global.WC_FRUIT_COST:
		$BuildMenu/Buildings/Woodcutter.disabled = false
	else:
		$BuildMenu/Buildings/Woodcutter.disabled = true
	
	if Global.wood >= Global.SC_WOOD_COST and Global.fruit >= Global.SC_FRUIT_COST:
		$BuildMenu/Buildings/Stonecutter.disabled = false
	else:
		$BuildMenu/Buildings/Stonecutter.disabled = true
	
	if Global.wood >= Global.FRF_WOOD_COST and Global.stone >= Global.FRF_STONE_COST:
		$BuildMenu/Buildings/Foodfarm.disabled = false
	else:
		$BuildMenu/Buildings/Foodfarm.disabled = true
	
	if Global.wood >= Global.SM_WOOD_COST and Global.stone >= Global.SM_STONE_COST and Global.fruit >= Global.SM_FRUIT_COST:
		$BuildMenu/Buildings/Sawmill.disabled = false
	else:
		$BuildMenu/Buildings/Sawmill.disabled = true
	
	if Global.planks >= Global.FF_PLANKS_COST and Global.stone >= Global.FF_STONE_COST and Global.fruit >= Global.FF_FRUIT_COST:
		$BuildMenu/Buildings/Flaxfarm.disabled = false
	else:
		$BuildMenu/Buildings/Flaxfarm.disabled = true
	
	if Global.planks >= Global.SAM_PLANKS_COST and Global.stone >= Global.SAM_STONE_COST and Global.fruit >= Global.SAM_FRUIT_COST:
		$BuildMenu/Buildings/Sailmaker.disabled = false
	else:
		$BuildMenu/Buildings/Sailmaker.disabled = true
	
	if Global.wood >= Global.SH_WOOD_COST and Global.planks >= Global.SH_PLANKS_COST and Global.stone >= Global.SH_STONE_COST:
		$BuildMenu/Buildings/Storage.disabled = false
	else:
		$BuildMenu/Buildings/Storage.disabled = true
	
	


func check_projects():
	if Global.museum:
		$ProjectMenu/Projects/Museum.hide()
	else:
		if Global.planks >= Global.MUS_PLANKS_COST  and Global.stone >= Global.MUS_STONE_COST  and Global.fruit >= Global.MUS_FRUIT_COST:
			$ProjectMenu/Projects/Museum.disabled=false
			$ProjectMenu/Projects/Museum/Icon.show()
			$ProjectMenu/Projects/Museum/IconDisabled.hide()
		else:
			$ProjectMenu/Projects/Museum.disabled=true
			$ProjectMenu/Projects/Museum/Icon.hide()
			$ProjectMenu/Projects/Museum/IconDisabled.show()
	
	if Global.museum and not Global.pedestals:
		$ProjectMenu/Projects/Pedestals.show()
		if Global.stone >= Global.PDS_STONE_COST    and Global.fruit >= Global.PDS_FRUIT_COST:
			$ProjectMenu/Projects/Pedestals.disabled=false
			$ProjectMenu/Projects/Pedestals/Icon.show()
			$ProjectMenu/Projects/Pedestals/IconDisabled.hide()
		else:
			$ProjectMenu/Projects/Pedestals.disabled=true
			$ProjectMenu/Projects/Pedestals/Icon.hide()
			$ProjectMenu/Projects/Pedestals/IconDisabled.show()
	else:
		$ProjectMenu/Projects/Pedestals.hide()
	
	if Global.harbours == 3:
		$ProjectMenu/Projects/Harbour.hide()
	else:
		if Global.planks >= Global.HAR_PLANKS_COST    and Global.stone >= Global.HAR_STONE_COST    and Global.sails >= Global.HAR_SAILS_COST:
			$ProjectMenu/Projects/Harbour.disabled=false
			$ProjectMenu/Projects/Harbour/Icon.show()
			$ProjectMenu/Projects/Harbour/IconDisabled.hide()
		else:
			$ProjectMenu/Projects/Harbour.disabled=true
			$ProjectMenu/Projects/Harbour/Icon.hide()
			$ProjectMenu/Projects/Harbour/IconDisabled.show()
	
	if Global.lighthouse:
		$ProjectMenu/Projects/Lighthouse.hide()
	else:
		if Global.planks >= Global.LTH_PLANKS_COST   and Global.stone >= Global.LTH_STONE_COST   and Global.fruit >= Global.LTH_FRUIT_COST:
			$ProjectMenu/Projects/Lighthouse.disabled=false
			$ProjectMenu/Projects/Lighthouse/Icon.show()
			$ProjectMenu/Projects/Lighthouse/IconDisabled.hide()
		else:
			$ProjectMenu/Projects/Lighthouse.disabled=true
			$ProjectMenu/Projects/Lighthouse/Icon.hide()
			$ProjectMenu/Projects/Lighthouse/IconDisabled.show()
	
	if Global.harbours > Global.ships and Global.lighthouse:
		$ProjectMenu/Projects/Ship.show()
		if Global.planks >= Global.SHP_PLANKS_COST     and Global.sails >= Global.SHP_SAILS_COST     and Global.fruit >= Global.SHP_FRUIT_COST:
			$ProjectMenu/Projects/Ship.disabled=false
			$ProjectMenu/Projects/Ship/Icon.show()
			$ProjectMenu/Projects/Ship/IconDisabled.hide()
		else:
			$ProjectMenu/Projects/Ship.disabled=true
			$ProjectMenu/Projects/Ship/Icon.hide()
			$ProjectMenu/Projects/Ship/IconDisabled.show()
	else:
		$ProjectMenu/Projects/Ship.hide()
	
	if Global.pedestals and Global.ships_available >= 1:
		$ProjectMenu/Projects/Expedition.show()
		if Global.planks >= Global.EXP_PLANKS_COST      and Global.sails >= Global.EXP_SAILS_COST      and Global.fruit >= Global.EXP_FRUIT_COST:
			$ProjectMenu/Projects/Expedition.disabled=false
			$ProjectMenu/Projects/Expedition/Icon.show()
			$ProjectMenu/Projects/Expedition/IconDisabled.hide()
		else:
			$ProjectMenu/Projects/Expedition.disabled=true
			$ProjectMenu/Projects/Expedition/Icon.hide()
			$ProjectMenu/Projects/Expedition/IconDisabled.show()
	else:
		$ProjectMenu/Projects/Expedition.hide()

func check_hotkeys():
	if Input.is_action_just_pressed("HK1"):
		_on_woodcutter_pressed()
	elif Input.is_action_just_pressed("HK2"):
		_on_stonecutter_pressed()
	elif Input.is_action_just_pressed("HK3"):
		_on_foodfarm_pressed()
	elif Input.is_action_just_pressed("HK4"):
		_on_sawmill_pressed()
	elif Input.is_action_just_pressed("HK5"):
		_on_flaxfarm_pressed()
	elif Input.is_action_just_pressed("HK6"):
		_on_sailmaker_pressed()
	elif Input.is_action_just_pressed("HK7"):
		_on_storage_pressed()


func _on_museum_pressed() -> void:
	if Global.planks >= Global.MUS_PLANKS_COST  and Global.stone >= Global.MUS_STONE_COST  and Global.fruit >= Global.MUS_FRUIT_COST:
		Global.planks = Global.planks - Global.MUS_PLANKS_COST 
		Global.stone = Global.stone - Global.MUS_STONE_COST 
		Global.fruit = Global.fruit - Global.MUS_FRUIT_COST 
		emit_signal("build_museum")
		check_projects()


func _on_lighthouse_pressed() -> void:
	if Global.planks >= Global.LTH_PLANKS_COST   and Global.stone >= Global.LTH_STONE_COST   and Global.fruit >= Global.LTH_FRUIT_COST:
		Global.planks = Global.planks - Global.LTH_PLANKS_COST  
		Global.stone = Global.stone - Global.LTH_STONE_COST  
		Global.fruit = Global.fruit - Global.LTH_FRUIT_COST 
		emit_signal("build_lighthouse")
		check_projects()


func _on_harbour_pressed() -> void:
	if Global.planks >= Global.HAR_PLANKS_COST    and Global.stone >= Global.HAR_STONE_COST    and Global.sails >= Global.HAR_SAILS_COST:
		Global.planks = Global.planks - Global.HAR_PLANKS_COST   
		Global.stone = Global.stone - Global.HAR_STONE_COST   
		Global.sails = Global.sails - Global.HAR_SAILS_COST 
		emit_signal("build_harbour")  
		check_projects()


func _on_pedestals_pressed() -> void:
	if Global.stone >= Global.PDS_STONE_COST    and Global.fruit >= Global.PDS_FRUIT_COST:
		Global.stone = Global.stone - Global.PDS_STONE_COST     
		Global.fruit = Global.fruit - Global.PDS_FRUIT_COST    
		emit_signal("build_pedestals")  
		check_projects()


func _on_ship_pressed() -> void:
	if Global.planks >= Global.SHP_PLANKS_COST     and Global.sails >= Global.SHP_SAILS_COST     and Global.fruit >= Global.SHP_FRUIT_COST:
		Global.planks = Global.planks - Global.SHP_PLANKS_COST    
		Global.sails = Global.sails - Global.SHP_SAILS_COST    
		Global.fruit = Global.fruit - Global.SHP_FRUIT_COST  
		emit_signal("build_ship")    
		check_projects()


func _on_expedition_pressed() -> void:
	if Global.planks >= Global.EXP_PLANKS_COST      and Global.sails >= Global.EXP_SAILS_COST      and Global.fruit >= Global.EXP_FRUIT_COST:
		Global.planks = Global.planks - Global.EXP_PLANKS_COST     
		Global.sails = Global.sails - Global.EXP_SAILS_COST     
		Global.fruit = Global.fruit - Global.EXP_FRUIT_COST    
		emit_signal("send_exp")   
		check_projects()
