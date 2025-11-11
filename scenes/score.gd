extends Control


var timed_out = false

func _ready() -> void:
	update_score()
	

func update_score():
	var minutes = floor(Global.time_used / 60)
	var seconds = round(Global.time_used - (60*minutes))
	var min_text = str(int(minutes))
	var sec_text = str(int(seconds))
	if seconds < 10:
		sec_text = "0" + sec_text
	
	$GridScreen/GridScore/TimeLabel.text = "Time          " + min_text + ":" + sec_text
	
	$GridScreen/GridScore/GridResCol/WoodCount.text = str(Global.wood_collected)
	$GridScreen/GridScore/GridResCol/StoneCount.text = str(Global.stone_collected)
	$GridScreen/GridScore/GridResCol/FruitCount.text = str(Global.fruit_collected)
	$GridScreen/GridScore/GridResCol/PlankCount.text = str(Global.planks_collected)
	$GridScreen/GridScore/GridResCol/FlaxCount.text = str(Global.flax_collected)
	$GridScreen/GridScore/GridResCol/SailCount.text = str(Global.sails_collected)
	
	$GridScreen/GridScore/GridBuilds/Woodcutters.text = str(Global.woodcutters_built)
	$GridScreen/GridScore/GridBuilds/Stonecutters.text = str(Global.stonecutters_built)
	$GridScreen/GridScore/GridBuilds/Fruitfarms.text = str(Global.fruitfarms_built)
	$GridScreen/GridScore/GridBuilds/Sawmills.text = str(Global.sawmills_built)
	$GridScreen/GridScore/GridBuilds/Flaxfarms.text = str(Global.flaxfarms_built)
	$GridScreen/GridScore/GridBuilds/Sailmakers.text = str(Global.sailmakers_built)
	$GridScreen/GridScore/GridBuilds/Storehouses.text = str(Global.storehouses_built)

func _on_timer_timeout() -> void:
	timed_out = true


func _input(event: InputEvent) -> void:
	if timed_out and event.is_pressed():
		Global.main_menu()
